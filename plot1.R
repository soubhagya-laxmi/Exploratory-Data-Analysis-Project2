## Set path

setwd("E:/shubbi study/R program/Corsera/Exploratory Data Analysis/week 4/case study project")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.
Total_Emission <- aggregate(Emissions ~ year,NEI,FUN = sum)

png('plot1.png')
barplot(height=Total_Emission$Emissions, names.arg=Total_Emission$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()
