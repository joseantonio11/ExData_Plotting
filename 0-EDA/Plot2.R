## PLOT 2 PNG - COURSERA WEEK 1 - COURSE PROJECT 1

setwd("/Users/JoseAntonio/Desktop/COURSERA/0-EDA")
#1 downlad and unzip database
nomearquivo <- "dataset.zip"
if (!file.exists(nomearquivo)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, nomearquivo, method="curl")}
if (!file.exists("./0-EAD")) {unzip(nomearquivo)}
pathIn <- file.path("./")
list.files(pathIn, recursive = TRUE)

#2 preparing the database
power_consum <- read.table("household_power_consumption.txt", 
                           header = TRUE, sep = ";",na.strings='?', stringsAsFactors=FALSE)

#3 converting date and subsetting the data 
power_consum$Date <- as.Date(power_consum$Date, format="%d/%m/%Y")
power_consum <- subset(power_consum, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#4 converting the date ant Time format to Date Class and store it in Datetime column
Datetime <- paste(as.Date(power_consum$Date), power_consum$Time)
power_consum$Datetime <- as.POSIXct(Datetime)

#5 PLOT 2 - GLOBAL ACTIVE POWER
plot(power_consum$Date,power_consum$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

#saving PNG
dev.copy(png,'plot2.png',  width = 480, height = 480)
dev.off()