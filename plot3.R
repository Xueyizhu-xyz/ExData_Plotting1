setwd("~/Desktop/ExData_Plotting1-master")
dat <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile ="consumption.zip")
dat <- unzip("consumption.zip")
data <- read.table("./household_power_consumption.txt",  header=T, sep=";", na.strings="?")

data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
time <- strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data <- cbind(time, data)

# plot 3
plot(data$time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(data$time, data$Sub_metering_2, col =  "red")
lines(data$time, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red","blue"), cex = 0.9, lty="solid")