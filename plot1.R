#Loading data from a txt file
#na symbol is "?", decimal separator is ".", field separator is ";" 
data<-read.table("D:/Eugene/R/hh power/household_power_consumption.txt",dec=".",sep=";",na.strings="?",header=T)

#Converting dates to date type
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#Subsetting 
data1<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

#Plotting
png("plot1.png", width=480, height= 480)
hist(data1$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")

#Saving to png
#dev.copy(png,file="D:/Eugene/R/hh power/plot1.png")
dev.off()