##Plot 3

setwd("./plottingassignment1/")
if(!file.exists("exdata-data-household_power_consumption.zip")) {
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                "./electricity.zip", method="curl")
  unzip("./electricity.zip", overwrite=TRUE)
}

electricity <- read.csv("~/plottingassignment1/household_power_consumption.txt", 
                        sep=";", header=TRUE, na.strings="?")
electricity$Date <- as.Date(electricity$Date, format = "%d/%m/%Y")
elecfeb <- electricity[(electricity$Date=="2007-02-01") | (electricity$Date=="2007-02-02"),]
elecfeb$Global_active_power <- as.numeric(as.character(elecfeb$Global_active_power))
elecfeb <- transform(elecfeb, time=as.POSIXct(paste(Date, Time)))

par(mfrow=c(1,1))

plot(elecfeb$time, elecfeb$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
points(elecfeb$time, elecfeb$Sub_metering_2, type="l", xlab="",
       ylab="Energy sub metering", col="red")
points(elecfeb$time, elecfeb$Sub_metering_3, type="l", xlab="",
       ylab="Energy sub metering", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1",
                                                                "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off() 