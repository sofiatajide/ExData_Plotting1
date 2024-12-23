# Load the necessary libraries
library(dplyr)


# Read the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Filter data for specific dates
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert Date and Time to POSIXct DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Create the plot
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

# Add x-axis labels (days of the week)
axis.POSIXct(1, at = seq(min(data$DateTime), max(data$DateTime), by = "day"), format = "%a")

dev.off()
