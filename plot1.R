#4-ExploratoryDataAnalysis
#Assignment 1 - plot1.R
#Created 5/11/14 Joseph Solway 
#Last Updated 06/07/14 Joseph Solway

#Load Source Data
setwd("C:/documents/_Personal/Big_Data/Scripts/4-ExploratoryDataAnalysis/")
filename <- "household_power_consumption.txt"
data5rows <- read.table(filename, sep = ";", header = T, nrows = 5)
classes <- sapply(data5rows, class)
data <- read.table(filename, sep = ";", header = T)

#Create date-time column of values
data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

#Create subset of data for specific date range
datasubset <- subset(data,as.Date(data$DateTime) == "2007-02-01" | as.Date(data$DateTime) == "2007-02-02")

#Change format of data to numeric
datasubset$Global_active_power <- as.numeric(as.character(datasubset$Global_active_power))
datasubset$Global_reactive_power <- as.numeric(as.character(datasubset$Global_reactive_power))
datasubset$Global_Voltage <- as.numeric(as.character(datasubset$Global_Voltage))
datasubset$Global_intensity <- as.numeric(as.character(datasubset$Global_intensity))
datasubset$Voltage <- as.numeric(as.character(datasubset$Voltage))
datasubset$Sub_metering_1 <- as.numeric(as.character(datasubset$Sub_metering_1))
datasubset$Sub_metering_2 <- as.numeric(as.character(datasubset$Sub_metering_2))
datasubset$Sub_metering_3 <- as.numeric(as.character(datasubset$Sub_metering_3))

#Create PLOT 1
hist((datasubset$Global_active_power), 
     col="red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", 
     breaks = 12, 
     xlim = c(0,6),
     xaxt = "n")
axis(1, at = c(0,2,4,6))

#Save plot as png file
library(datasets)
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off()

