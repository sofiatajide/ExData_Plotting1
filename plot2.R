# Load necessary libraries
library(dplyr)


# Read the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Filter data for specific dates
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert Date and Time to POSIXct DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Create the plot
png("plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")

# Add x-axis labels (days of the week)
axis.POSIXct(1, at = seq(min(data$DateTime), max(data$DateTime), by = "day"), format = "%a")

dev.off()
