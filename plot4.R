#read data in and only save the part that is needed
data<-read.table("./data/hw1.txt",sep=";",header=TRUE)
rd<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]
rm(data)

#concatenate $Date and $Time
d<-strptime(paste(as.character(rd$Date),as.character(rd$Time)),"%d/%m/%Y %H:%M:%S")

#set the number of subplot matrix
par(mfrow = c(2, 2)) 

#plot1
plot(d,as.numeric(as.character(rd$Global_active_power)),type="l",xlab="",ylab="Global Active Power(kilowatts)")

#plot2
plot(d,as.numeric(as.character(rd$Voltage)),type="l",xlab="datetime",ylab="voltage")

#plot3
plot(d,as.numeric(as.character(rd$Sub_metering_1)),type="l",xlab="",ylab="Energy sub metering",col="black")
points(d,as.numeric(as.character(rd$Sub_metering_2)),type="l",col="red")
points(d,as.numeric(as.character(rd$Sub_metering_3)),type="l",col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4
plot(d,as.numeric(as.character(rd$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
#copy .png out
dev.copy(png,"plot4.png")
dev.off()

#memory cleaning
rm(rd)