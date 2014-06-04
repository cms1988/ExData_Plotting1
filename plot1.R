#Common - importing, formating and subsetting on two dates
setwd("c://Users//a42664//Desktop//Coursera//WD_R//ExData")
data_all <-read.table("household_power_consumption.txt",sep = ";",header=T,na.strings = "?")
data_all$Date<-as.Date(data_all$Date,"%d/%m/%Y")
data<-subset(data_all, as.Date(Date) == "2007-02-01" | as.Date(Date) == "2007-02-02" )
DateTime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data<-cbind(data,DateTime)

#1st Plot
hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.copy(png,file="plot1.png")
dev.off()
