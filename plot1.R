#Exploratory Data Analysis_Course Project 1_plot1.R

#set to own working directory first
#assume user has already downloaded and unzip the Dataset into a sub-directory named "data"
#Only using data from the dates 2007-02-01 and 2007-02-02
data <- read.table("./data/household_power_consumption.txt", header = T, sep=";", na.strings = "?")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

png("plot1.png", width=480, height=480) # Open PNG device; create 'plot1.png' in my working directory
hist(subData$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")
dev.off() #to close the PNG graphics device
