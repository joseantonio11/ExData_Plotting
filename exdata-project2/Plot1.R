## Coursera Exploratory Data Analysis - Project 2

## QUESTION 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
##             Using the base plotting system, make a plot showing the total PM2.5 emission from all 
##             sources for each of the years 1999, 2002, 2005, and 2008.

setwd("/Users/JoseAntonio/Desktop/COURSERA/0-EDA/exdata-project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## PLOT1 
Totals <- aggregate(Emissions ~ year,NEI, FUN = "sum")
Totals$Emissions <- round(Totals[, 2] / 1000, 2)
barplot(
  Totals$Emissions,
  names.arg=Totals$year,
  xlab="Year",
  ylab="PM2.5 Emissions in Kilotons",
  main="Total PM2.5 Emissions From All US Sources"
)
#saving PNG
dev.copy(png,'plot1.png',  width = 800, height = 800)
dev.off()

## ANSWER: YES. THE TOTAL EMISSIONS HAVE DECREASED IN THIS PERIOD.







