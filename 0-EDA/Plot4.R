## PLOT 4 PNG - COURSERA WEEK 1 - COURSE PROJECT 1

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

#5 PLOT 4 - FOUR PLOTS 
par(mfrow=c(2,2))
plot(power_consum$Datetime, power_consum$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(power_consum$Datetime, power_consum$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(power_consum$Datetime, power_consum$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(power_consum$Datetime, power_consum$Sub_metering_2, type = "l", col = "red")
lines(power_consum$Datetime, power_consum$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=1.0)
plot(power_consum$Datetime, power_consum$Global_reactive_power, ylim = c(0.0, 0.5),  type = "l", xlab = "datetime", ylab = "Global_reactive_power") 

#saving PNG for Plot4
dev.copy(png,'plot4.png',  width = 480, height = 480)
dev.off()
