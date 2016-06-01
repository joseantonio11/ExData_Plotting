## Coursera Exploratory Data Analysis - Project 2

## QUESTION 5: How have emissions from motor vehicle sources changed from 1999???2008 in Baltimore City?

setwd("/Users/JoseAntonio/Desktop/COURSERA/0-EDA/exdata-project2")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subsetting vehicles Baltimore
## find "vehicle" SCC
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
## subset of vehicles
SCCvehicles <- SCC[vehicles,]$SCC
## match SCC to NEI data
NEIvehicles <- NEI[NEI$SCC %in% SCCvehicles,]
## gather emissions per year
vehiclesBaltimore <- NEIvehicles[NEIvehicles$fips==24510,]

## PLOT5
g <- ggplot(vehiclesBaltimore,aes(factor(year),Emissions)) 
g <- g + geom_bar(stat="identity",fill="grey",width=0.75)
g <- g + theme(panel.background = element_rect(colour = "blue"))
g <- g + labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)"))
g <- g + labs(title=expression("PM"[2.5]*" Motor Vehicle Sources Emissions Baltimore 1999-2008"))
print(g)

#saving PNG
dev.copy(png,'plot5.png',  width = 800, height = 800)
dev.off()

## ANSWER: EMISSIONS FROM MOTOR VEHICLE SOURCES HAVE DROPPED FROM 1999-2008 IN BALTIMORE CITY!

