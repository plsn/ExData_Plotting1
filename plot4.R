#Exploratory Data Analysis_Course Project 1_plot4.R

#set to own working directory first
#assume user has already downloaded and unzip the Dataset into a sub-directory named "data"
#Only using data from the dates 2007-02-01 and 2007-02-02
data <- read.table("./data/household_power_consumption.txt", header = T, sep=";", na.strings = "?")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

dateTime <- strptime(paste(subData$Date, subData$Time), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480) # Open PNG device; create 'plot4.png' in my working directory
par(mfrow = c(2, 2)) #Plot rows first then columns

plot(dateTime, subData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(dateTime, subData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(dateTime, subData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(dateTime, subData$Sub_metering_2, type = "l", col = "red")
lines(dateTime, subData$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col = c("black", "red", "blue"), bty = "n")

plot(dateTime, subData$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
