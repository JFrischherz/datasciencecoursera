####This code creates plot 2

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
WHERE [Date]in ('1/2/2007','2/2/2007') AND [Time] <> '?' AND Global_active_power <> '?' "
, sep=";")




##plot creation
plot(strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S"),data$Global_active_power,
			type = "l",
			xlab = "",
			ylab = "Global Active Power (kilowatts)"
)




##save plot
dev.copy(png, file = "plot2.png",width=480,height=480)
dev.off()