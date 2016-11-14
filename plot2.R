# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.
# Generate the graph in the same directory as the source code

# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)

# Subset data
subsetNEI <- subset(NEI,fips %in% "24510")



Total_Emission <- aggregate(Emissions ~ year,subsetNEI,FUN = sum)


png('plot2.png')
barplot(height=Total_Emission$Emissions, names.arg=Total_Emission$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()
