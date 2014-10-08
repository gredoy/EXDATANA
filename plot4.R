data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
#head(data)
subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

par(mfrow=c(2,2))

#plot 1
x <- as.Date(subset$Date, format="%d/%m/%Y")
datetime1 <- paste(x, subset$Time)
datetime <- strptime(datetime1, format="%Y-%m-%d %H:%M:%S")

plot(datetime, subset$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

#plot 2
plot(datetime, subset$Voltage, ylab="Voltage", type="l")

#plot 3
plot(datetime, subset$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(datetime, subset$Sub_metering_2, xlab="", ylab="Energy sub metering", type="l", col="Red")
lines(datetime, subset$Sub_metering_3, xlab="", ylab="Energy sub metering", type="l", col="Blue")

# places a legend at the appropriate place
# puts text in the legend 
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("Black", "Red", "Blue"), cex = 0.5, lwd=c(1,1,1), bty="n", y.intersp = 0.2) 

#plot 4
plot(datetime, subset$Global_reactive_power, ylab="Global_reactive_power", type="l")

dev.copy(png, file="plot4.png")
dev.off()
