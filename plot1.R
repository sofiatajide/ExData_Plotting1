# Load the necessary libraries
library(dplyr)

# Read data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Plot 1
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
