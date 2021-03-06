png(file='Plot4.png')
dataRead<-read.table('household_power_consumption.txt',header=TRUE,na.strings="?",sep=';')
dataRead$Date<-as.Date(dataRead$Date,format="%d/%m/%Y")
data<-subset(dataRead,Date== "2007-02-01" | Date=="2007-02-02" )
data$datime<-strptime(paste(data$Date,data$Time,sep=" "),format="%Y-%m-%d %H:%M:%S")
par(mfrow=c(2,2))
plot(data$datime,data$Global_active_power,type='l',ylab='Global Active Power',xlab='')
plot(data$datime,data$Voltage,type='l',xlab='datetime',ylab='Voltage')
plot(data$datime,data$Sub_metering_1,type='l',ylab='Energy sub metering',xlab="",col='black')
lines(data$datime,data$Sub_metering_2,col='red')
lines(data$datime,data$Sub_metering_3,col='blue')
legend("topright",col=c('Black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,bty='n')
plot(data$datime,data$Global_reactive_power,type='l',ylab='Global_reactive_power',xlab='datetime')
dev.off()