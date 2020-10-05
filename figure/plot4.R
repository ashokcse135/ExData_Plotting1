temp <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE)
data <- subset(temp, Date == "1/2/2007" | Date == "2/2/2007")
data$Global_active_power <- as.numeric(data$Global_active_power)


png("plot4.png")
par(mfrow = c(2,2))
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
datetime <- paste(data$Date, data$Time, sep=" ")
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub meeting")
lines(datetime, data$Sub_metering_2, type = "l", col = "red")
lines(datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, lwd =2, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

plot(datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()