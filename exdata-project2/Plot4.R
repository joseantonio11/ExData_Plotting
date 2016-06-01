## Coursera Exploratory Data Analysis - Project 2

## QUESTION 4: Across the United States, how have emissions from coal combustion-related sources
##             changed from 1999???2008?

setwd("/Users/JoseAntonio/Desktop/COURSERA/0-EDA/exdata-project2")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subsetting coal combustion
## identifying coal keyword column EI.Sector SCC - separate coal CSS subset
wordCoal<-unique(grep("coal", SCC$EI.Sector, ignore.case=TRUE, value=TRUE))
sccCoal<-subset(SCC, EI.Sector %in% wordCoal)    
## getting SCC coal data from NEI
coal<-subset(NEI, SCC %in% sccCoal$SCC)    

## PLOT4
g <- ggplot(data=coal, aes(factor(year), Emissions, fill = type)) 
g <- g + geom_bar(stat="identity", position=position_dodge()) 
g <- g + labs(x="Year", y="Emissions") 
g <- g + ggtitle("U.S. Coal Combustion-Related Sources data from 1999-2008")
print(g)

#saving PNG
dev.copy(png,'plot4.png',  width = 800, height = 800)
dev.off()

## ANSWER: THE EMISSIONS OF COAL COMBUSTIONS HAVE DECREASED FROM 1999-2008 

  