# The third plot
# setwd("C:/MOOCs/Coursera/Current/Exploratory Data Analysis/Week1/ExData_Plotting1")

# Get the column classes
tab5rows <- read.table("../household_power_consumption.txt", sep =";", na.strings = "?", header = TRUE, nrows = 5)
classes <- sapply(tab5rows, class)

# Read all the raw data
rawPower=read.table("../household_power_consumption.txt", sep =";", na.strings = "?", header = TRUE, colClasses = classes)
# Extract just the 2 days we want
power=rawPower[rawPower$Date== "1/2/2007" | rawPower$Date== "2/2/2007", c(1, 2, 7:9)]
power$dateTime=strptime(paste(power$Date, power$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
power$dayOfWeek<-substr(weekdays(power$dateTime), 1, 3)

# Draw the plot
png(file = "plot3.png", width = 480, height = 480, units = "px")

plot(power$dateTime, power$Sub_metering_1, main = "", xlab = "",
     ylab = "Energy sub metering", type = "n")
lines(power$dateTime, power$Sub_metering_1)
lines(power$dateTime, power$Sub_metering_2, col="red")
lines(power$dateTime, power$Sub_metering_3, col="blue")
legend("topright", pch = "_", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
