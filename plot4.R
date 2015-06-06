# this code assumes that you've downloaded the data file into the code directory
quartz()
tbl<-read.table('household_power_consumption.txt',sep=';')

#convert table to data frame for easier manipulation
tblfrm<-as.data.frame.matrix(tbl)

start<- as.Date('2007-02-01')
end<- as.Date('2007-02-02')

#clean and filter the data frame to 2 days and no NA's
tblfrm2<- tblfrm[tblfrm$V3!="?",]
tblfrm2<- tblfrm2[as.Date(tblfrm2$V1,format = "%d/%m/%Y")>=start & 
                      as.Date(tblfrm2$V1,format = "%d/%m/%Y")<=end,]

#create a 2x2 table of charts
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

## chart from 'plot2' on 1st row/col
plot(strptime(paste(tblfrm2$V2,tblfrm2$V1,sep=","),'%H:%M:%S,%d/%m/%Y',tz='GMT'),
     as.numeric(tblfrm2$V3),
     type="l",
     xlab="",
     ylab="Global Active Power(kilowatts)")

## voltage vs datetime in row1/col2
plot(strptime(paste(tblfrm2$V2,tblfrm2$V1,sep=","),'%H:%M:%S,%d/%m/%Y',tz='GMT'),
     as.numeric(tblfrm2$V5),
     type="l",
     xlab="datetime",
     ylab="Voltage")

##chart from plot 3 as row2/col1
plot(strptime(paste(tblfrm2$V2,tblfrm2$V1,sep=","),'%H:%M:%S,%d/%m/%Y',tz='GMT'),
     as.numeric(tblfrm2$V7),
    type="l",
    xlab="",
    ylab="Energy Sub Metering")
#overlay sub_metering_2 in red
lines(strptime(paste(tblfrm2$V2,tblfrm2$V1,sep=","),'%H:%M:%S,%d/%m/%Y',tz='GMT'),
     as.numeric(tblfrm2$V8),
     type="l",
     col="red")
#overlay sub_metering_3 in blue
lines(strptime(paste(tblfrm2$V2,tblfrm2$V1,sep=","),'%H:%M:%S,%d/%m/%Y',tz='GMT'),
     as.numeric(tblfrm2$V9),
     type="l",
     col="blue")
# add a legend with lines (pch=NA, lwd, ced) instead of shapes. *bty=n* to suppress box
legend("topright",
       lwd = 2, cex = 1, 
    col = c("black","red", "blue"), 
    legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),
    bty="n",
    lty = c(1, 1, 1), 
    pch = c(NA, NA, NA)
    )

## global reactive power in row2/col2
plot(strptime(paste(tblfrm2$V2,tblfrm2$V1,sep=","),'%H:%M:%S,%d/%m/%Y',tz='GMT'),
     as.numeric(tblfrm2$V4),
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")


dev.copy(png,"plot4.png")
dev.off()
