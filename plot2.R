# plot2.R 
# Exploratory Data Analysis - Course Project 2
# David del Moral (david.delmoral@gmail.com)
# 
# Question 1
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Load required libraries
library(dplyr)

# Setting the working directory. It must exists to run this script.
setwd("C:/Users/ddelmoral/Documents/Personal/Learning/Exploratory Data Analysis/project2")

# Reading data files
neid <- readRDS("summarySCC_PM25.rds")
sccd <- readRDS("Source_Classification_Code.rds")

# Define color set
colorset <- c("red", "blue", "yellow", "green")

# Data is aggregated
total.emissions <- aggregate(Emissions ~ year, neid, sum)

# fips: A five-digit number (represented as a string) indicating the U.S. county, 24510 is used for Baltimore

baltimoreCityMD.emissions<-summarise(group_by(filter(neid, fips == "24510"), year), Emissions=sum(Emissions))

barplot(
          height=baltimoreCityMD.emissions$Emissions/1000, 
          names.arg=baltimoreCityMD.emissions$year,
          xlab="Year", 
          ylab=expression('Total PM2.5 emissions (kilotons)'), 
          main=expression('Total PM2.5 emissions in Baltimore City-MD from 1999 to 2008'),
          col=colorset
        )

# As can be observed from the plot, the total emissions for Baltimore City MD, 
# have decreased from 1999 to 2008, but not continuosly.