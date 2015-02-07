####This code creates plot 1

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
WHERE [Date]in ('1/2/2007','2/2/2007') "
, sep=";")




##plot creation

hist(data$Global_active_power, 
		col = "red",	
		main = "Global Active Power"	,			
		xlab = "Global Active Power (kilowatts)"	)


##save plot
dev.copy(png, file = "plot1.png",width=480,height=480)
dev.off()