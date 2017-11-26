# plot1.R 
# Exploratory Data Analysis - Course Project 2
# David del Moral (david.delmoral@gmail.com)
# 
# Question 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

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

# Plot total emmissions per year in the US
barplot(
        height=total.emissions$Emissions/1000000, 
        names.arg=total.emissions$year, xlab="Year",  
        ylab=expression('PM2.5 emissions (millions of tons)'),  
        main=expression('Total PM2.5 emissions from all US'), 
        col=colorset
        )


# As can be observed from the plot, the total emissions have decreased from 1999 to 2008


