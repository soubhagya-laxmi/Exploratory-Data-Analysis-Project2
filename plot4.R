library(ggplot2)
setwd("E:/shubbi study/R program/Corsera/Exploratory Data Analysis/week 4/case study project")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Merge both data set 
NEI_SCC <- merge(NEI, SCC, by="SCC")

# fetch all NEIxSCC records with Short.Name (SCC) Coal
coalMatches  <- grepl("coal", NEI_SCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEI_SCC[coalMatches, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)

png("plot4.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()