install.packages("dplyr")
library(dplyr)

install.packages("lubridate")
library(lubridate)

## Set correctly the directory
setwd("/Users/mara/COURSERA/C4_Exploratory_Data_Analysis/C4_W1/Assignment")

##Download, unlink and and unzip the dataset. 

URLfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URLfile, destfile="file.zip", method="curl")

unlink("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

unzip("file.zip")

## read file, converting "?" into NA
inputFile<- read.csv("household_power_consumption.txt",na.strings="?", sep=";")
head(inputFile)

##convert Date 
inputFile$Date<-as.Date(inputFile$Date, "%d/%m/%Y")

##Select subsample with Date between 2007-02-01 and 2007-02-02
subSet<-subset(inputFile, subset=(Date>="2007-02-01" & Date<="2007-02-02" ))

##Create new column DateTime
subSet$DateTime<-as.POSIXct(paste(subSet$Date, subSet$Time))

##set par to only 1 plot 39 par(mfrow=c(1,1))
par(mfrow=c(1,1))

##create plot
plot(subSet$Sub_metering_1~subSet$DateTime, type="l", xlab="",ylab="Global Active Power (kilowatts)")
## add to existing plot
> points(subSet$Sub_metering_2~subSet$DateTime, type="l", col="red")
> points(subSet$Sub_metering_3~subSet$DateTime, type="l", col="blue")
## add a legend 
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##create png file
png(file = "plot3.png",width = 480, height = 480, units = "px", bg="white")
par(mfrow=c(1,1))
plot(subSet$Sub_metering_1~subSet$DateTime, type="l", xlab="",ylab="Global A    ctive Power (kilowatts)")
points(subSet$Sub_metering_2~subSet$DateTime, type="l", col="red")
points(subSet$Sub_metering_3~subSet$DateTime, type="l", col="blue")
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##close device
dev.off()
