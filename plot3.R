#read data in and only save the part that is needed
data<-read.table("./data/hw1.txt",sep=";",header=TRUE)
rd<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]
rm(data)

#concatenate $Date and $Time
d<-strptime(paste(as.character(rd$Date),as.character(rd$Time)),"%d/%m/%Y %H:%M:%S")

#plot and add points
plot(d,as.numeric(as.character(rd$Sub_metering_1)),type="l",xlab="",ylab="Energy sub metering",col="black")
points(d,as.numeric(as.character(rd$Sub_metering_2)),type="l",col="red")
points(d,as.numeric(as.character(rd$Sub_metering_3)),type="l",col="blue")

#set legend
legend("topright",lwd=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#copy .png out
dev.copy(png,"plot3.png")
dev.off()

#memory cleaning
rm(rd)