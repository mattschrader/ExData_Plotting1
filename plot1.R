library(dplyr)

d <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
for (i in 3:9) {
        d[, i] <- as.numeric(d[, i])
}

data <- filter(d, Date == "1/2/2007" | Date == "2/2/2007")

date <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot1.png", width=480, height=480) 

# Plot 1
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.off()








