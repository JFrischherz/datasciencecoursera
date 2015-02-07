####This code creates plot 4

##loading required packages 
library(sqldf)
library(dplyr)
library(datasets)

##setting working directory
setwd("./R/ExploratoryDataAnalysis/Project1")


##reading in required data: 01/02/2007 & 02/02/2007
data <- read.csv.sql("./household_power_consumption.txt", 
sql = "SELECT  * 
FROM file 
WHERE [Date]in ('1/2/2007','2/2/2007') 
AND [Time] <> '?'
AND Global_active_power <> '?'
AND Voltage <> '?'
AND Sub_metering_1 <> '?' 
AND Sub_metering_2 <> '?' 
AND Sub_metering_3 <> '?' "
, sep=";")




##plot creation

par(mfrow = c(2,2))

##plot2 - Global Active Power
plot(strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S"),data$Global_active_power,
			type = "l",
			xlab = "",
			ylab = "Global Active Power"
)

##new plot 1 - Voltage
plot(strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S"),data$Voltage,
			type = "l",
			xlab = "datetime",
			ylab = "Voltage"
)



##plot 3 - Energy Sub Metering
plot(strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S"),
data$Sub_metering_1,
			type = "l",
			xlab = "",
			ylab = "Energy sub metering",
			col = "black"
)
lines(strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S"),
data$Sub_metering_2,
			col = "red"
)
lines(strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S"),
data$Sub_metering_3,
			col = "blue"
)
legend("topright", lwd = 1,col = c("black","red","blue"), bty = "n",
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


##new plot 2 - Globl reactive power
plot(strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S"),data$Global_reactive_power,
			type = "l",
			xlab = "dateime",
			ylab = "Global_reactive_power"
)



##save plot
dev.copy(png, file = "plot4.png",width=580,height=480)
dev.off()