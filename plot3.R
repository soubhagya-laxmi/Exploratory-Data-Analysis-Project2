library(ggplot2)
setwd("E:/shubbi study/R program/Corsera/Exploratory Data Analysis/week 4/case study project")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)

subsetNEI <- subset(NEI,fips %in% "24510")

Total_Emission_type <- aggregate(Emissions ~ year+type,subsetNEI,FUN = sum)

png("plot3.png", width=640, height=480)
g <- ggplot(Total_Emission_type, aes(year, Emissions, color = type))
g <- g + geom_line() + 
  xlab("Year")+ 
  ylab(expression('Total PM'[2.5]*" Emissions"))+
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()