plot2 <- function(){
   
   # Read in the raw data - assumed to be in the current directory
   rawdata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
   
   # Select just the data from 2007-02-01 and 2007-02-02
   library(dplyr)
   selectdata <- filter(rawdata,Date == "1/2/2007" | Date == "2/2/2007")
   
   # Combine Date and Time into a new column, DateTime, in POSIXlt format
   selectdata$DateTime <- as.POSIXlt(paste(as.Date(selectdata$Date,format="%d/%m/%Y"),selectdata$Time, sep=" "))
   
   # Plot a line chart of Global Active Power vs. date/time to a file
   png(filename="plot2.png",width=480,height=480,units="px")
   plot(selectdata$DateTime,selectdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
   dev.off()
}