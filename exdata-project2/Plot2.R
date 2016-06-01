## Coursera Exploratory Data Analysis - Project 2

## QUESTION 2: Have total emissions from PM2.5 decreased in the Baltimore City,
##             Maryland (???????????????? == "????????????????????") from 1999 to 2008? Use the base
##             plotting system to make a plot answering this question.

setwd("/Users/JoseAntonio/Desktop/COURSERA/0-EDA/exdata-project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## PLOT2 Subset of NEI and plot
baltimore <- subset(NEI, NEI$fips=="24510")
totalBaltimore <- aggregate(Emissions ~ year, baltimore, FUN = "sum")
barplot(
  totalBaltimore$Emissions,
  names.arg=totalBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions -Tons-Baltimore)",
  main="Total PM2.5 Emissions for Baltimore City"
)
#saving PNG
dev.copy(png,'plot2.png',  width = 800, height = 800)
dev.off()

## ANSWER: AS WE CAN SEE FROM THE PLOT, OVERALL TOTAL EMISSIONS FROM PM2.5 HAVE DECREASED 
##         IN BALTIMORE CITY FROM 1999 TO 2008.
