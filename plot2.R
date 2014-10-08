data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
#head(data)
subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

x <- as.Date(subset$Date, format="%d/%m/%Y")
datetime1 <- paste(x, subset$Time)
datetime <- strptime(datetime1, format="%Y-%m-%d %H:%M:%S")

plot(datetime, subset$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

dev.copy(png, file="plot2.png")
dev.off()
