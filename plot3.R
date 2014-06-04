#Common - importing, formating and subsetting on two dates
setwd("c://Users//a42664//Desktop//Coursera//WD_R//ExData")
data_all <-read.table("household_power_consumption.txt",sep = ";",header=T,na.strings = "?")
data_all$Date<-as.Date(data_all$Date,"%d/%m/%Y")
data<-subset(data_all, as.Date(Date) == "2007-02-01" | as.Date(Date) == "2007-02-02" )
DateTime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data<-cbind(data,DateTime)

#3rd Plot
plot.ts(data$Sub_metering_1,ylab="Energy sub metering",axes=FALSE,xlab="")
axis(2)
lines(data$Sub_metering_2,col="red")
lines(data$Sub_metering_3,col="blue")
axis(1, labels=c("Thu","Fri","Sat"), at=c("1",length(data$Global_active_power)/2,length(data$Global_active_power)))
box()
legend("topright",lty=c(1,1,1),lwd=c(1,1,1),legend=colnames(data)[7:9], col=c("black","red","blue"))
dev.copy(png,file="plot3.png")
dev.off()
