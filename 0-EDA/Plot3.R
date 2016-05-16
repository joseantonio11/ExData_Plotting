## PLOT 3 PNG - COURSERA WEEK 1 - COURSE PROJECT 1

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

#5 PLOT 3 - ENERGY SUB METERING
plot(power_consum$Datetime, power_consum$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(power_consum$Datetime, power_consum$Sub_metering_2, type = "l", col = "red")
lines(power_consum$Datetime, power_consum$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=1.0)

#saving PNG for Plot3
dev.copy(png,'plot3.png',  width = 480, height = 480)
dev.off()
