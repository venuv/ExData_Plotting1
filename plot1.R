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

#draw histogram with title
hist(as.numeric(tblfrm2$V3),col="red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)")

#save to plot1.png
dev.copy(png,"plot1.png")
dev.off()
