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

#create the png file
png(filename="plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

#design the first plot
x <- strptime(paste(dataset$Date,dataset$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
plot(x,dataset$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")

#design the second plot
plot(x,dataset$Voltage,type="l", xlab="", ylab="Voltage")

#design the third plot
plot(x, dataset$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(x, dataset$Sub_metering_2, type="l", col="red")
lines(x, dataset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#design the fourth plot
plot(x,dataset$Global_reactive_power,type="l", xlab="", ylab="Global_reactive_power")

#close the device
dev.off()