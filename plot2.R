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

plot(strptime(paste(tblfrm2$V2,tblfrm2$V1,sep=","),'%H:%M:%S,%d/%m/%Y',tz='GMT'),
     as.numeric(tblfrm2$V3),
#    main="Global Active Power By Day",
    type="l",
    xlab="",
    ylab="Global Active Power(kilowatts)")

dev.copy(png,"plot2.png")
dev.off()
