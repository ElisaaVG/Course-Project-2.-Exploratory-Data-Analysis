# 4 - Across the United States, how have emissions from 
  #coal combustion-related sources changed from 1999-2008?
#*******************************************************************************

#Move files to current working directory to read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data
coal_scc_1 <- SCC[SCC$EI.Sector == "Fuel Comb - Electric Generation - Coal", 1]
coal_scc_2 <- SCC[SCC$EI.Sector == "Fuel Comb - Industrial Boilers, ICEs - Coal", 1]
coal_scc_3 <- SCC[SCC$EI.Sector == "Fuel Comb - Comm/Institutional - Coal", 1]

NEI_coal_scc_1 <- subset(NEI, SCC %in% coal_scc_1)
NEI_coal_scc_2 <- subset(NEI, SCC %in% coal_scc_2)
NEI_coal_scc_3 <- subset(NEI, SCC %in% coal_scc_3)

NEI_coal_scc <- rbind(NEI_coal_scc_1, NEI_coal_scc_2, NEI_coal_scc_3)


# plot
library(plyr)
library(ggplot2)

  png(filename = "plot4.png", width=480, height=480)  
  plot_data <- ddply(NEI_coal_scc, .(year), numcolwise(sum))
  plot <- ggplot(plot_data) + aes(x = factor(year), y = Emissions, group = 1) + geom_point(size = 4) + geom_line() + labs(title = expression('Emissions of PM'[2.5] ~ 'in the United States'),subtitle = "By Coal Comsumption" , x = "Year", y = expression("Total PM"[2.5] ~ "Emission (tons)")) + theme(plot.title = element_text(size = 10))
  print(plot)
  
  dev.off()
  
  #*******************************************************************************
  #CONCLUSION 
  #Emissions across the United States related to coal combustion has decreased from 1999 to 2008.