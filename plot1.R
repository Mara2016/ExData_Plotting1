install.packages("dplyr")
library(dplyr)

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



##set par to only 1 plot
par(mfrow=c(1,1))

##create histogram
hist(as.numeric(subSet$Global_active_power), col="red", xlab="Global active power (kilowatts)", main="Global Active Power", ylim=c(0,1200))

##create png file
png(file = "plot1.png",width = 480, height = 480, units = "px", bg="white")
par(mfrow=c(1,1))
hist(as.numeric(subSet$Global_active_power), col="red", xlab="Global active power (kilowatts)", main="Global Active Power", ylim=c(0,1200))

##close device
dev.off()

