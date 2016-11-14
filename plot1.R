setwd("E:/shubbi study/R program/Corsera/Exploratory Data Analysis/week 4/case study project")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)

Total_Emission <- aggregate(Emissions ~ year,NEI,FUN = sum)

png('plot1.png')
barplot(height=Total_Emission$Emissions, names.arg=Total_Emission$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()