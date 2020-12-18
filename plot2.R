# 2 - Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#from 1999 to 2008? Use the base plotting system to make a plot 
#*******************************************************************************

# Move files to current working directory to read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Subset to just data from Baltimore and then add up emissions for each year
baltimore <- subset(NEI, fips=="24510")
baltimore_year <- aggregate(baltimore$Emissions,by=list(baltimore$year),FUN=sum)

png("plot2.png", width=480, height=480)
par(mar=c(5,5,4,2))
plot(baltimore_year$Group.1, baltimore_year$x,
  type = "l",
  lwd=2,
  xlab="Year",
  ylab=expression('Total PM'[2.5] ~ 'Emissions(Tons)'),
  ylim=c(0,3500),
  col="cyan",
  main=expression('Emissions of PM'[2.5] ~ 'in Baltimore City, MD'))
dev.off()

#*******************************************************************************
#CONCLUSION
#Emissions in Baltimore City, MD have decreased from 1999 to 2008 
#but it was not a stable decrease in emissions with a spike in 2005.