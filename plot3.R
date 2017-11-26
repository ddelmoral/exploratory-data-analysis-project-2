# plot3.R 
# Exploratory Data Analysis - Course Project 2
# David del Moral (david.delmoral@gmail.com)
# 
# Question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a 
# plot answer this question.Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") 


# Load required libraries
library(dplyr)
library(ggplot2)

# Setting the working directory. It must exists to run this script.
setwd("C:/Users/ddelmoral/Documents/Personal/Learning/Exploratory Data Analysis/project2")

# Reading data files
neid <- readRDS("summarySCC_PM25.rds")
sccd <- readRDS("Source_Classification_Code.rds")

# Data is aggregated
total.emissions <- aggregate(Emissions ~ year, neid, sum)

# fips: A five-digit number (represented as a string) indicating the U.S. county, 24510 is used for Baltimore

baltimoreCityMD.emissions.year<-summarise(group_by(filter(neid, fips == "24510"), year, type), Emissions=sum(Emissions))

g<-ggplot(baltimoreCityMD.emissions.year, aes(x=factor(year), y=Emissions, fill=type)) +
          geom_bar(stat="identity") +
          facet_grid(.~type, scales = "free", space="free") + 
          labs(x="Year", y="Total PM2.5 emission (Tons)") + 
          labs(title="PM emissions, Baltimore City, MD 1999-2008 by Source Type")
        

print(g)

# As can be observed from the plot, the "NON-ROAD", "NONPOINT" and "ON-ROAD" have decreased
# "POINT", shows the increase/decrease