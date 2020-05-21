# load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";",
                   na.strings = "?",stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
view <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
# Plotting
with(view, hist(Global_active_power, main="Global Active Power", col="red"))
dev.copy(png, "plot1.png", width=480,height = 480,units="px")
dev.off()
