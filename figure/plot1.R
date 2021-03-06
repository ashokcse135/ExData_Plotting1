temp <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE)
data <- subset(temp, Date == "1/2/2007" | Date == "2/2/2007")
data$Global_active_power <- as.numeric(data$Global_active_power)
png("plot1.png")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()