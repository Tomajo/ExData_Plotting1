setwd("~/R/workspace/ExploratoryDataAnalisys/project1")
data<-read.csv('household_power_consumption.txt',header = TRUE,sep = ';',na.string='?')
data$Date<-paste(data$Date,data$Time,sep=' ')
data<-data[,c(1,3,4,5,6,7,8,9)]
data$Date<-as.POSIXct(strptime(data$Date,format = '%d/%m/%Y %H:%M:%S'))
data<-data[format(data$Date, '%Y-%m-%d')>'2007-01-03' & format(data$Date, '%Y-%m-%d')<'2007-01-06',]
data$Global_active_power<-as.numeric(data$Global_active_power)
png(filename = 'plot3.png')
plot(data$Date,data$Sub_metering_1,type = 'l',ylab = 'Global Active Power (kilowatts)',xlab='')
lines(data$Date,data$Sub_metering_2,col='red')
lines(data$Date,data$Sub_metering_3,col='blue')
legend("topright", col = c("black","red", "blue"), legend = c("Sub Metering 1", "Sub Metering 2","Sub Metering 3"),lwd = 1)
dev.off()