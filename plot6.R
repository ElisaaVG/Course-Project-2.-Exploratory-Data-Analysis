# 6 - Compare emissions from motor vehicle sources in Baltimore City with Los Angeles County, California (fips=="06037").
  # Which city has seen greater changes over time in motor vehicle emissions?
#*******************************************************************************

#Move files to current working directory to read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data
onroad_scc <- SCC[SCC$Data.Category == "Onroad", 1]
onroad_NEI <- subset(NEI, SCC %in% onroad_scc)
baltimore_onroad_NEI <- subset(onroad_NEI, onroad_NEI$fips == "24510")
baltimore_onroad_NEI$city <- "Baltimore City"
los_angeles_onroad_NEI <- subset(onroad_NEI, onroad_NEI$fips == "06037")
los_angeles_onroad_NEI$city <- "Los Angeles County"

# plot
library(plyr)
library(ggplot2)

  png(filename = "plot6.png", width=480, height=480)  
  combined_data <- rbind(baltimore_onroad_NEI, los_angeles_onroad_NEI)
  plot_data <- ddply(combined_data, .(year, city), numcolwise(sum))
  plot <- ggplot(plot_data) + aes(x = factor(year), y = Emissions, group = factor(city), colour = factor(city)) + geom_point(size = 4) + geom_line() + labs(title = expression('Emissions of PM'[2.5] ~ 'Motor Vehicles'),subtitle = "Baltimore City vs Los Angeles", x = "Year", y = expression("Total PM"[2.5] ~ "Emission (tons)"), colour = "City") + theme(plot.title = element_text(size = 8))
  print(plot)
  
  dev.off()
  
  #*******************************************************************************
  #CONCLUSION
  #Emissions related to motor vehicle sources in Baltimore City vs Los Angeles has stark differences. 
  #Emmissions from Los Angeles heavily over power emissions from Balitimore City. Los Angeles has not decreased motor vehicle emissions at all from 1999 to 2008 while Baltimore City decreased emissions by over half.