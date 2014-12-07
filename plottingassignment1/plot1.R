##Plot 1

setwd("./plottingassignment1")
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

par(mfrow=c(1,1))

hist(elecfeb$Global_active_power, main=paste("Global Active Power"), xlab="Global Active Power 
  (kilowatts)", ylab="Frequency", col="red", breaks=13, ylim=c(0,1200), xlim=c(0,6))
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off() 
