plot1 <- function(){
	library(data.table)
	a <- fread("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",
		colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
	b <- a[strptime(a$Date,"%d/%m/%Y") >= strptime("2007-02-01","%Y-%m-%d")
	& strptime(a$Date,"%d/%m/%Y") <= strptime("2007-02-02","%Y-%m-%d")]

	png (filename = "plot1.png")
	
	hist(as.numeric(b$Global_active_power),col="red",
		xlab="Global Active Power (kilowatts)",main="Global Active Power")
	dev.off()

}