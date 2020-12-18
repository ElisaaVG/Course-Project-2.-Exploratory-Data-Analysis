# 5 - How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
#*******************************************************************************

#Move files to current working directory to read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data
onroad_scc <- SCC[SCC$Data.Category == "Onroad", 1]
onroad_NEI <- subset(NEI, SCC %in% onroad_scc)
baltimore_onroad_NEI <- subset(onroad_NEI, onroad_NEI$fips == "24510")

# plot
library(plyr)
library(ggplot2)

  png(filename = "plot5.png", width=480, height=480)
  plot_data <- ddply(baltimore_onroad_NEI, .(year), numcolwise(sum))
  plot <- ggplot(plot_data) + aes(x = factor(year), y = Emissions, group = 1) + geom_point(size = 4) + geom_line() + labs(title = expression('Emissions of PM'[2.5] ~ 'in Baltimore'),subtitle = "By Motor Vehicles" , x = "Year", y = expression("Total PM"[2.5] ~ "emission (tons)")) + theme(plot.title = element_text(size = 10))
  print(plot)
  
  dev.off()
  
  #*******************************************************************************
  #CONCLUSION 
  #Emissions in Baltimore City, MD related to motor vehicle sources has steadily decreased from 1999 to 2008.