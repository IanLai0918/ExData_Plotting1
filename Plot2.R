#Plot 2 gives the information on the household global minute-averaged active power (in kilowatt) over three days of the week.

#The first step is to read the file 
datafile <- "C:/Users/apoor/OneDrive/Desktop/household_power_consumption.txt"
data <- read.table(datafile, header = TRUE, 
                   sep = ";", stringsAsFactors = FALSE)

# Converting the date variables into class format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subsetting the data into subpowerdata
subpowerdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting the dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Converting the dates and times
data$datetime <- as.POSIXct(data$datetime)

# Plotting the graph of global active power on x-axis vs days on y-axis
attach(subpowerdata)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
     
#Saving the file to your documents
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)
