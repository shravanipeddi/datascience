plot2 <- function(){
	library(data.table)
	a <- fread("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",
		colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
	b <- a[strptime(a$Date,"%d/%m/%Y") >= strptime("2007-02-01","%Y-%m-%d")
	& strptime(a$Date,"%d/%m/%Y") <= strptime("2007-02-02","%Y-%m-%d")]

	png (filename = "plot2.png")
	
	plot(strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S"),
		as.numeric(b$Global_active_power),ylab="Global Active Power (kilowatts)",
		xlab="",main="Global Active Power",type="n")
	lines(strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S"),
		as.numeric(b$Global_active_power))

	dev.off()
}