##data acquisition
names_of_cols<-names(read.csv("household_power_consumption.txt",nrows=1,sep=";"))
lines_to_drop <- 31*24*60+(31-16)*24*60+6*60+36
lines_to_pull<-2*24*60
x<-read.csv("household_power_consumption.txt",nrows=lines_to_pull,sep=";",skip=lines_to_drop)
names(x)<-names_of_cols
d1<-as.character(x$Date)
d2<-as.character(x$Time)
new_<-paste(d1,d2)
new_date<-strptime(new_,"%d/%m/%Y %X")
x$Date<-new_date
x$Time<-NULL
##Set english daynames
Sys.setlocale("LC_TIME", "en_US")
##plot
png(filename="plot4.png",width = 480, height = 480,bg="transparent")
op <- par(mfcol = c(2, 2)) # 2 x 2 pictures on one plot

##Plot1,1
plot(x$Date,x$Global_active_power,type="l",ylab="Global Active Power",xlab="")
##Plot2,1
plot(x$Date,x$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x$Date,x$Sub_metering_2,col="red")
lines(x$Date,x$Sub_metering_3,col="blue")
legend("topright",lty="solid",col=c("black","red","blue"),legend=names(x)[6:8],box.lwd=0)
##Plot1,2
plot(x$Date,x$Voltage,type="l",ylab="Voltage",xlab="datetime")
##Plot2,2
plot(x$Date,x$Global_reactive_power,type="l",ylab="Voltage",xlab="datetime")

dev.off()
par(op)
