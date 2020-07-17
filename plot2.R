library(dplyr)

# read the data from the txt file
d <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
for (i in 3:9) {
        d[, i] <- as.numeric(d[, i])
}

# filter the data for the two selected days
data <- filter(d, Date == "1/2/2007" | Date == "2/2/2007")

date <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# plot 2
png("plot2.png", width=480, height=480)

date <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
plot(date, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()

