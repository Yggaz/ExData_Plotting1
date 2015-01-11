#Loading data from a txt file
#na symbol is "?", decimal separator is ".", field separator is ";" 
data<-read.table("D:/Eugene/R/hh power/household_power_consumption.txt",dec=".",sep=";",na.strings="?",header=T)

#Converting dates to date type
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#Subsetting 
data1<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

# combining date and time
data1$DateTime <- as.POSIXct(paste(data1$Date, data1$Time))

png("plot4.png", width = 480, height = 480)

#Setting display of charts
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

#Chart 1
plot(data1$DateTime,data1$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",lwd=1,type="l")

#Chart2
plot(data1$DateTime,data1$Voltage,ylab="Voltage",xlab="DateTime",lwd=1,type="l")

#Chart3
plot(data1$DateTime,data1$Sub_metering_1,ylab="Energy sub metering",xlab="",lwd=1,type="l")
lines(data1$DateTime,data1$Sub_metering_2,col="red")
lines(data1$DateTime,data1$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c("black", "red", "blue"))

#Chart 4
plot(data1$DateTime,data1$Global_reactive_power,ylab="Global_rective_power",xlab="DateTime",lwd=1,type="l")

dev.off()