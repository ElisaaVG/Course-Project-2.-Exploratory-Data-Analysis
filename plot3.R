# 3 - Of the four types of sources indicated by the type variable, 
  #which have seen decreases in emissions from 1999-2008 for Baltimore City? 
  #Which have seen increases in emissions from 1999-2008? Use the ggplot2
#*******************************************************************************

# Move files to current working directory to read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset to just data from Baltimore
baltimore <- subset(NEI, fips=="24510")
baltimore_year <- aggregate(baltimore$Emissions,by=list(baltimore$type, baltimore$year),FUN=sum)
colnames(baltimore_year) <- c("Type", "Year", "Emissions")

# Create plot with ggplot2
library(ggplot2)
png(filename = "plot3.png", width=480, height=480)
par(mar=c(5,5,5,5))
qplot(Year, Emissions, data = baltimore_year, color = Type) +
labs(title = expression('Emissions of PM'[2.5] ~ 'in Baltimore'), x = "Year", y =expression('Total PM'[2.5] ~ 'Emissions(Tons)'), fill = "Year")+
geom_line() + geom_point() 
dev.off()

#*******************************************************************************
#CONCLUSION  
#Emissions from on-road, non-point, and on-road sources all significantly decreased from 1999 to 2008. 
#The only source that increased emissions slightly was from the point source
  
