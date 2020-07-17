library(dplyr)

# read the data from the txt file
d <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
for (i in 3:9) {
        d[, i] <- as.numeric(d[, i])
}

# filter the data for the two selected days
data <- filter(d, Date == "1/2/2007" | Date == "2/2/2007")

date <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# plot 3
png("plot3.png", width=480, height=480)

plot(date, data$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(date, data$Sub_metering_2, col = "red", type = "l")
lines(date, data$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()

