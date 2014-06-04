#Common - importing, formating and subsetting on two dates
setwd("c://Users//a42664//Desktop//Coursera//WD_R//ExData")
data_all <-read.table("household_power_consumption.txt",sep = ";",header=T,na.strings = "?")
data_all$Date<-as.Date(data_all$Date,"%d/%m/%Y")
data<-subset(data_all, as.Date(Date) == "2007-02-01" | as.Date(Date) == "2007-02-02" )
DateTime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data<-cbind(data,DateTime)

#4th Plot
par(mfrow=c(2,2))

#1,1
plot.ts(data$Global_active_power,ylab="Global Active Power (kilowatts)",axes=FALSE,xlab="")
axis(2)
axis(1, labels=c("Thu","Fri","Sat"), at=c("1",length(data$Global_active_power)/2,length(data$Global_active_power)))
box()

#1,2
plot.ts(data$Voltage,ylab="Voltage",axes=FALSE,xlab="datetime")
axis(2)
axis(1, labels=c("Thu","Fri","Sat"), at=c("1",length(data$Global_active_power)/2,length(data$Global_active_power)))
box()

#2,1
plot.ts(data$Sub_metering_1,ylab="Energy sub metering",axes=FALSE,xlab="")
axis(2)
lines(data$Sub_metering_2,col="red")
lines(data$Sub_metering_3,col="blue")
axis(1, labels=c("Thu","Fri","Sat"), at=c("1",length(data$Global_active_power)/2,length(data$Global_active_power)))
legend("topright",lty=c(1,1,1),lwd=c(1,1,1),legend=colnames(data)[7:9], col=c("black","red","blue"),bty="n")
box()

#2,2
plot.ts(data$Global_reactive_power,ylab="Global_reactive_power",axes=FALSE,xlab="datetime")
axis(2)
axis(1, labels=c("Thu","Fri","Sat"), at=c("1",length(data$Global_active_power)/2,length(data$Global_active_power)))
box()

dev.copy(png,file="plot4.png")
dev.off()
