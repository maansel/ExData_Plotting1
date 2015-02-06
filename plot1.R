plot1 <- function(){
   
   # Read in the raw data - assumed to be in the current directory
   rawdata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
   
   # Select just the data from 2007-02-01 and 2007-02-02
   library(dplyr)
   selectdata <- filter(rawdata,Date == "1/2/2007" | Date == "2/2/2007")
   
   # Plot a histogram of Global Active Power to a file
   png(filename="plot1.png",width=480,height=480,units="px")
   hist(selectdata$Global_active_power,main=paste("Global Active Power"),xlab="Global Active Power (kilowatts)",col="red")
   dev.off()
}