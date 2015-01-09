#read data in and only save the part that is needed
data<-read.table("./data/hw1.txt",sep=";",header=TRUE)
rd<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]
rm(data)

#run histogram on certain data
hist(as.numeric(as.character(rd$Global_active_power)),main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")

#copy .png out
dev.copy(png,"plot1.png")
dev.off()

#memory cleaning
rm(rd)