#Common - importing, formating and subsetting on two dates
setwd("c://Users//a42664//Desktop//Coursera//WD_R//ExData")
data_all <-read.table("household_power_consumption.txt",sep = ";",header=T,na.strings = "?")
data_all$Date<-as.Date(data_all$Date,"%d/%m/%Y")
data<-subset(data_all, as.Date(Date) == "2007-02-01" | as.Date(Date) == "2007-02-02" )
DateTime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data<-cbind(data,DateTime)

#2nd Plot
plot.ts(data$Global_active_power,ylab="Global Active Power (kilowatts)",axes=FALSE,xlab="")
axis(2)
axis(1, labels=c("Thu","Fri","Sat"), at=c("1",length(data$Global_active_power)/2,length(data$Global_active_power)))
box()
dev.copy(png,file="plot2.png")
dev.off()
