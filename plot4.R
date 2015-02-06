plot4 <- function(){
   
   # Read in the raw data - assumed to be in the current directory
   rawdata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
   
   # Select just the data from 2007-02-01 and 2007-02-02
   library(dplyr)
   selectdata <- filter(rawdata,Date == "1/2/2007" | Date == "2/2/2007")
   
   # Combine Date and Time into a new column, DateTime, in POSIXlt format
   selectdata$DateTime <- as.POSIXlt(paste(as.Date(selectdata$Date,format="%d/%m/%Y"),selectdata$Time, sep=" "))

   # Plot 4 line charts in a 2x2 grid and save to a file
   png(filename="plot4.png",width=480,height=480,units="px")
   par(mfrow=c(2,2))
   
   # First plot is Global_active_power vs. date/time
   plot(selectdata$DateTime,selectdata$Global_active_power,type="l",xlab="",ylab="Global Active Power")
   
   # Second plot is Voltage vs. date/time
   plot(selectdata$DateTime,selectdata$Voltage,type="l",xlab="datetime",ylab="Voltage")
   
   # Third plot is Sub_metering_1,2 and 3 vs. date/time
   plot(selectdata$DateTime,selectdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
   lines(selectdata$DateTime,selectdata$Sub_metering_2,type="l",col="red")
   lines(selectdata$DateTime,selectdata$Sub_metering_3,type="l",col="blue")
   legend("topright",col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),bty="n")
   
   # Fourth plot is Global_reactive_power vs. date/time
   plot(selectdata$DateTime,selectdata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
   
   dev.off()
   
}
