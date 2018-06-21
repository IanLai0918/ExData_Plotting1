# Plot 1 gives the data of Global Active power (kilowatts) which gives the household global minute-averaged active power (in kilowatt) from the UC Irvine Machine Learning Repository

# The first step is to read the file
datafile <- "C:/Users/apoor/OneDrive/Desktop/household_power_consumption.txt"
data <- read.table(datafile, header = TRUE, 
                   sep = ";", stringsAsFactors = FALSE)
                   
# Convverting the date variables into the date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# The data is then subsetted by filtering the dates 2007-02-01 & 2007-02-02 only)
subpowerdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting the dates & times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Generating the plot
attach(subpowerdata)
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saving the plot1 file to your computer
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(subpowerdata)
