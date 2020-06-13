setwd("~/Desktop/ExData_Plotting1-master")
dat <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile ="consumption.zip")
dat <- unzip("consumption.zip")
data <- read.table("./household_power_consumption.txt",  header=T, sep=";", na.strings="?")

data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
time <- strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data <- cbind(time, data)

# plot 2
plot(data$time, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", col = "black", type = "l")