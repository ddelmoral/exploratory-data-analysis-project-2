# Question6.R 
# Exploratory Data Analysis - Course Project 2
# David del Moral (david.delmoral@gmail.com)
# 
# Question 6:
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037").
# Which city has seen greater changes over time in motor vehicle emissions? 
# 


# Load required libraries
library(dplyr)
library(ggplot2)

# Setting the working directory. It must exists to run this script.
setwd("C:/Users/ddelmoral/Documents/Personal/Learning/Exploratory Data Analysis/project2")

# Reading data files
neid <- readRDS("summarySCC_PM25.rds")
sccd <- readRDS("Source_Classification_Code.rds")

# Data for Baltimore & Los Angeles is summarized
baltimore.vehicles.neid       <-  summarise(group_by(filter(neid, fips == "24510" & type == 'ON-ROAD'), year), Emissions=sum(Emissions))
losangeles.vehicles.neid      <-  summarise(group_by(filter(neid, fips == "06037" & type == 'ON-ROAD'), year), Emissions=sum(Emissions))
baltimore.vehicles.neid$city  <-  "Baltimore City"
losangeles.vehicles.neid$city <-  "Los Angeles"
comb.neid <- rbind(baltimore.vehicles.neid, losangeles.vehicles.neid)


#Chart is plotted

g <- ggplot(
  comb.neid, aes(x=factor(year), y=Emissions, fill=city, label = round(Emissions))) +
  geom_bar(stat="identity") +
  facet_grid(city~., scales="free") +
  xlab("Year")+
  ylab("Total PM2.5 emissions (kilotons)") + 
  ggtitle("PM2.5 Motor vehicle emissions in Baltimore & Los Angeles, 1999-2008")+
  geom_label(aes(fill = city), colour = "gray100")

print(g)

# as can be observed clearly form the chart, Los Angeles has seen the greatest changes over time 
# in motor vehicle emissions.