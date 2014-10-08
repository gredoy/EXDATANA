data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
#head(data)
subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

hist(subset$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="Red")

dev.copy(png, file="plot1.png")
dev.off()
