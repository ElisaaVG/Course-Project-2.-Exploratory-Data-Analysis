# 1 - Using the base plotting system, make a plot showing the total PM2.5 emission 
      #from all sources for each of the years 1999, 2002, 2005, and 2008.
#*******************************************************************************

# Move files to current working directory to read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data from 1999 to 2008 
total_emmissions <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png", width=480, height=480)
par(mar=c(5,5,4,2))
barplot(
  (total_emmissions$Emissions)/10^6,
  names.arg=total_emmissions$year,
  xlab="Year",
  ylab=expression(Total ~ PM[2.5] ~ Emissions(Tons ~10^6)),
  ylim = c(0, 7.5),
  main=expression('Emissions of PM'[2.5] ~ ' in the United States'))

dev.off()

#*******************************************************************************
#CONCLUSION
#The total PM2.5 emissions across the United States has decreased from 1999 to 2008. 
#The total emissions stabilized from 2002 to 2005 but significantly decreased from 2005-2008.