# this code assumes that you've downloaded the data file into the code directory
quartz()
tbl<-read.table('household_power_consumption.txt',sep=';')
hist(as.numeric(tbl$V3)/1000,col="red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)")
dev.copy(png,"plot1.png")
dev.off()
