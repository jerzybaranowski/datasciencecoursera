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

##histogram
png(filename="plot1.png",width = 480, height = 480,bg="transparent")
hist(x[,2],col="red",xlab="Global Active Power (kilowats)",main="Global Active Power",bg="transparent")
dev.off()

