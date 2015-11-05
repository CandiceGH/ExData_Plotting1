#     PLOT 4: Multiple base plots summarizing time vs four variable from power consumption dataset 
#     Candice, November 04, 2015
#
#     Dataset: Individual household electric power consumption Data Set: Electric power consumption [20Mb]
#
#     Description: Measurements of electric power consumption in one household with a one-minute 
#     sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering 
#     values are available. Please see the README.md within this folder for more information on the variables
#     used to create these plots, including their units.

## 1. Workspace set-up and download of the data.
# 1a. Setting local directory:
localdir<-getwd()       # saves the local directory address
setwd(localdir)         # sets the work space to match the local address
getwd()                 # checks the above is true

# 1b. Check to see if i) raw Power Consumption and ii) working data storage directories exists, if FALSE, create them:
if (!file.exists("exdatahouseholdpower")) {dir.create("exdatahouseholdpower")}
if (!file.exists("data")) {dir.create("data")}
list.files("./")      # Check to ensure folder is created

# 1c. Downloading zip file from the internet:
## Checking to see if data has already been downloaded. If yes, continue, if no, download.
if (file.exists("./exdatahouseholdpower/consumption.zip")) {
  print("Power data available") 
}       else {
  print("Downloading and unzipping Power data...")
  Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(Url, destfile = "./exdatahouseholdpower/consumption.zip", mode = "wb")
  dateDownloaded <- date()
  list.files("./exdatahouseholdpower")
  # 1d. Unzipping data file and storing it in a working data directory. Rename the folder to be simple:
  unzip("./exdatahouseholdpower/consumption.zip", exdir = "./data")
  list.files("./data")
  name<-as.character(list.files("./data"))
  rm(name, Url)
}

# 1e. Check to see if raw data is present, if TRUE, continue.
if (file.exists("./exdatahouseholdpower/consumption.zip")) print("Data available") else stop("!!!Need data!!!") 

## 2. Loading data in R workspace from only the dates 2007-02-01 and 2007-02-02:
# 2a. Reading in the first 10 lines of the data to see the first date and time.  
data10<-read.table("./data/household_power_consumption.txt", sep = ";", nrows = 10, header = T)

# 2b. Set dates and times needed to 'subset' data when loading into R
firstDateTime <- strptime("2006-12-16 17:24:00", "%Y-%m-%d %H:%M:%S")
beginDateTime <- strptime("2007-02-01 00:01:00", "%Y-%m-%d %H:%M:%S")

# 2c. Calculate which lines to read in
begin <- beginDateTime - firstDateTime
beginLine <- as.numeric(begin) * 24 * 60 # first line to read in
numLines <- 48 * 60 # total number of minutes in 48 hours, total number of rows to read in

# 2d. Reading in only the pertinent data. The missing values '?' are converted to 'NA'.
data<-read.table("./data/household_power_consumption.txt", sep = ";", skip = beginLine, nrows = numLines, na.strings = "?")

# 2e. Creating clean and tidy data set.
# Renaming the columns after they're cut during extraction.
colnames<-names(data10); names(data)=colnames
# Converting the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.  
SetTime <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
#finalData <- cbind(SetTime, data)
data$Date<-SetTime
data$Time<-SetTime
data$Date<-as.Date(data$Date)
#str(data)

# 3. Plot 4: Multiple base plots summarizing time vs four variable from power consumption dataset  
# opening png graphic device
png("plot4.png", width = 480, height = 480)
# setting multiple base plot framework
par(mfrow = c(2, 2))
# first plot
with(data, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))
# second plot
with(data, plot(Time, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))
# third plot
with(data, plot(Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(data, lines(Time, Sub_metering_2, col = "red"))
with(data, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# forth plot
with(data, plot(Time, Global_reactive_power, type = "l", xlab = "datetime")) # ylab = "Global_reactive_power"
# closing png graphic device
dev.off()

# 4. Cleaning house:
rm(begin, beginDateTime, beginLine, colnames, firstDateTime, numLines, SetTime, data10, localdir)


