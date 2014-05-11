# The first plot
# setwd("C:/MOOCs/Coursera/Current/Exploratory Data Analysis/Week1/ExData_Plotting1")

# Get the column classes
tab5rows <- read.table("../household_power_consumption.txt", sep =";", na.strings = "?", header = TRUE, nrows = 5)
classes <- sapply(tab5rows, class)

# Read all the raw data
rawPower=read.table("../household_power_consumption.txt", sep =";", na.strings = "?", header = TRUE, colClasses = classes)
# Extract just the 2 days we want
power=rawPower[rawPower$Date== "1/2/2007" | rawPower$Date== "2/2/2007",]

# Draw the histogram
png(file = "plot1.png", width = 480, height = 480, units = "px")

hist(power$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
