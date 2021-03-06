png(file='Plot2.png')
dataRead<-read.table('household_power_consumption.txt',header=TRUE,na.strings="?",sep=';')
dataRead$Date<-as.Date(dataRead$Date,format="%d/%m/%Y")
data<-subset(dataRead,Date== "2007-02-01" | Date=="2007-02-02" )
data$datime<-strptime(paste(data$Date,data$Time,sep=" "),format="%Y-%m-%d %H:%M:%S")
plot(data$datime,data$Global_active_power,type='l',ylab='Global Active Power (kilowatts)',xlab="")
dev.off()