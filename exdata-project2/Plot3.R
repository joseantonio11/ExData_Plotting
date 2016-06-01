## Coursera Exploratory Data Analysis - Project 2

## QUESTION 3: Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
##             variable, which of these four sources have seen decreases in emissions from 1999???2008 
##             for Baltimore City (fips=24510? Which have seen increases in emissions from 1999???2008? 
##             Use the ggplot2 plotting system to make a plot answer this question

setwd("/Users/JoseAntonio/Desktop/COURSERA/0-EDA/exdata-project2")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## PLOT3
baltimore <- subset(NEI, NEI$fips==24510)
g <- ggplot(data = baltimore,aes(factor(year),Emissions,fill=type))
g <- g + geom_bar(stat="identity")
g <- g + facet_grid(.~type,scales = "free",space="free") 
g <- g + guides(fill=FALSE)
g <- g + labs(x="Years", y=expression("Total PM"[2.5]*" Emission (Tons)"))
g <- g + labs(title=expression("PM"[2.5]*"Emissions for Baltimore 1999-2008 by Type of Source"))
print(g)

#saving PNG
dev.copy(png,'plot3.png',  width = 800, height = 800)
dev.off()

## ANSWER: THE NON-ROAD, NONPOINT and ON-ROAD SOURCE TYPES HAVE DECREASED EMISSIONS OVERALL
##         FROM 1999-2008 IN BALTIMORE CITY.
##         THE POINT HAS A SIGNIFICANT INCREASE UNTIL 2005 AND DECREASES AGAIN IN 2008.
