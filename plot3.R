#Loading data from a txt file
#na symbol is "?", decimal separator is ".", field separator is ";" 
data<-read.table("D:/Eugene/R/hh power/household_power_consumption.txt",dec=".",sep=";",na.strings="?",header=T)

#Converting dates to date type
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#Subsetting 
data1<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

# combining date and time
data1$DateTime <- as.POSIXct(paste(data1$Date, data1$Time))

# Plotting:
png("plot3.png", width = 480, height = 480)
plot(data1$DateTime, data1$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data1$DateTime, data1$Sub_metering_2, type="l", col="red")
lines(data1$DateTime, data1$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()