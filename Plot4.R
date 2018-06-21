# Plot 4 gives all the four plots together which gives the household global minute-averaged active power (in kilowatt) from the UC Irvine Machine Learning Repository

# The first step is to read the file
datafile <- "C:/Users/apoor/OneDrive/Desktop/household_power_consumption.txt"
powerdata <- read.table(datafile, header = TRUE, 
                   sep = ";", stringsAsFactors = FALSE)

# Subsetting the data & changing the date & time variables into characters and objects respectively
subpowerdata <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")
subpowerdata$Date <- as.Date(subpowerdata$Date, format="%d/%m/%Y")
subpowerdata$Time <- strptime(subpowerdata$Time, format="%H:%M:%S")
subpowerdata[1:1440,"Time"] <- format(subpowerdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpowerdata[1441:2880,"Time"] <- format(subpowerdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Initalising and generating the plot required
par(mfrow=c(2,2))
with(subpowerdata,{
  plot(subpowerdata$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subpowerdata$Time,as.numeric(as.character(subpower$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpowerdata$Time,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subpowerdata,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subpowerdata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subpowerdata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty = 2, bty = 'n', lwd = 2, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.3)
  plot(subpowerdata$Time,as.numeric(as.character(subpowerdata$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
} )

#Saving the plot to file
dev.copy(png, "plot4.png")
dev.off()

       
