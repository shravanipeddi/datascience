plot4 <- function(){
	library(data.table)
	a <- fread("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",
		colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
	b <- a[strptime(a$Date,"%d/%m/%Y") >= strptime("2007-02-01","%Y-%m-%d")
	& strptime(a$Date,"%d/%m/%Y") <= strptime("2007-02-02","%Y-%m-%d")]

	png (filename = "plot4.png")
	par(mfrow= c(2,2))
	plot(strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S"),
		as.numeric(b$Global_active_power),ylab="Global Active Power",
		xlab="",type="n")
	lines(strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S"),
		as.numeric(b$Global_active_power))

	plot(strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(b$Voltage),xlab="datetime",ylab="Voltage",type="n")
	lines(strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(b$Voltage),col="blue")


	plot(c(strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S"),
		strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S"),
		strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S")),
		c(as.numeric(b$Sub_metering_1),as.numeric(b$Sub_metering_2),as.numeric(b$Sub_metering_3)),type="n",xlab=""
		,ylab="Energy sub metering")
	lines(strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(b$Sub_metering_1),col="red")
	lines(strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(b$Sub_metering_2),col="blue")
	lines(strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(b$Sub_metering_3),col="black")
	legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("red","blue","black"))

	plot(strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S"),
		as.numeric(b$Global_reactive_power),ylab="Global_reactive_power",xlab="datetime",type="n")
	lines(strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S"),
		as.numeric(b$Global_reactive_power),col="black")

	dev.off()

}