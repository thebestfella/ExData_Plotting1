#read data in and only save the part that is needed
data<-read.table("./data/hw1.txt",sep=";",header=TRUE)
rd<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]
rm(data)

#concatenate $Date and $Time
d<-strptime(paste(as.character(rd$Date),as.character(rd$Time)),"%d/%m/%Y %H:%M:%S")

#plot
plot(d,as.numeric(as.character(rd$Global_active_power)),type="l",xlab="",ylab="Global Active Power(kilowatts)")

#copy .png out
dev.copy(png,"plot2.png")
dev.off()

#memory cleaning
rm(rd)