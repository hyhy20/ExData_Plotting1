# load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";",
                   na.strings = "?",stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
view <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
view$Time <- as.POSIXct(paste(view$Date,view$Time))
# open device
png("plot2.png",width=480,height = 480,units="px")
# plotting
with(view, plot(Time, Global_active_power, xlab="", 
               ylab="Global Active Power (kilowatts)",type="l"))
#close
dev.off()