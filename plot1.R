
#set the url to download the data
URL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#create the directory 'data' to download the data file, if it doesn't exist 
if(!file.exists("./dataNew")){dir.create("./dataNew")}
#download file
download.file(URL,destfile="./dataNew/dataset.zip")
# Uncompress data file
  unzip("./dataNew/dataset.zip")

#read the data
dataset <- read.table("./household_power_consumption.txt",sep=";",skip=66637,nrows=2880,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#create the png file plot1.png
png(filename="plot1.png",width = 480, height = 480)

#create the histogram
hist(dataset$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#close the png file device
dev.off()