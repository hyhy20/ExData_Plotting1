# load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";",
                   na.strings = "?",stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
view <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
view$Time <- as.POSIXct(paste(view$Date,view$Time))
# open device
png("plot3.png",width=480,height = 480,units="px")
# plotting
with(view, plot(Time, Sub_metering_1, xlab="", 
                ylab="Energy sub metering",type="l", col="grey"))
with(view, points(Time, Sub_metering_2, type="l", col="red"))
with(view, points(Time, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col=c("grey","red","blue"),
       legend = c("Sub_metering1","Sub_metering2","Sub_metering3"))
#close
dev.off()