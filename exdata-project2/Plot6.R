## Coursera Exploratory Data Analysis - Project 2

## QUESTION 6: Compare emissions from motor vehicle sources in Baltimore City (fips == "24510") 
##      with emissions from ## motor vehicle sources in Los Angeles County, California (fips=="06037"). 
##      Which city has seen greater changes over time in motor vehicle emissions?

setwd("/Users/JoseAntonio/Desktop/COURSERA/0-EDA/exdata-project2")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subsetting vehicles from Baltimore (plot4) and LA
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCCvehicles <- SCC[vehicles,]$SCC
NEIvehicles <- NEI[NEI$SCC %in% SCCvehicles,]
vehiclesBaltimore <- NEIvehicles[NEIvehicles$fips=="24510",]
## comparing emission
vehiclesBaltimore$city <- "Baltimore City"
vehiclesLA <- NEIvehicles[NEIvehicles$fips=="06037",]
vehiclesLA$city <- "Los Angeles County"
vehiclesBaltimoreLA <- rbind(vehiclesBaltimore,vehiclesLA)

## PLOT5
g <- ggplot(vehiclesBaltimoreLA, aes(x=factor(year), y=Emissions, fill=city))
g <- g + geom_bar(aes(fill=year),stat="identity")
g <- g + facet_grid(scales="free", space="free", .~city)
g <- g + theme_bw() + guides(fill=FALSE)
g <- g + labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)"))
g <- g + labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions Baltimore & LA-1999-2008"))
print(g)

## guides(fill=FALSE)
#saving PNG
dev.copy(png,'plot6.png',  width = 800, height = 800)
dev.off()

## ANSWER: LOS ANGELES COUNTY HAS SEEN THE GREATEST CHANGES OVER TIME IN MOOTO VEHICLE EMISSIONS


