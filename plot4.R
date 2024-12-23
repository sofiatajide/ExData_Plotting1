# Load necessary libraries
library(dplyr)

# Read the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Filter data for specific dates
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert Date and Time to POSIXct DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Create the plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Plot 1: Global Active Power
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis.POSIXct(1, at = seq(min(data$DateTime), max(data$DateTime), by = "day"), format = "%a")

# Plot 2: Voltage
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis.POSIXct(1, at = seq(min(data$DateTime), max(data$DateTime), by = "day"), format = "%a")

# Plot 3: Energy sub metering
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")
axis.POSIXct(1, at = seq(min(data$DateTime), max(data$DateTime), by = "day"), format = "%a")

# Plot 4: Global Reactive Power
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power", xaxt = "n")
axis.POSIXct(1, at = seq(min(data$DateTime), max(data$DateTime), by = "day"), format = "%a")

dev.off()
