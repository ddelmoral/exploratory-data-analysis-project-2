# plot5.R 
# Exploratory Data Analysis - Course Project 2
# David del Moral (david.delmoral@gmail.com)
# 
# Question 5:
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 
# 


# Load required libraries
library(dplyr)
library(ggplot2)

# Setting the working directory. It must exists to run this script.
setwd("C:/Users/ddelmoral/Documents/Personal/Learning/Exploratory Data Analysis/project2")

# Reading data files
neid <- readRDS("summarySCC_PM25.rds")
sccd <- readRDS("Source_Classification_Code.rds")

# Vehicle data is separated
vehicles      <- grepl("vehicle", sccd$SCC.Level.Two, ignore.case=TRUE)
vehicles.sccd <- sccd[vehicles,]$SCC
vehicles.neid <- neid[neid$SCC %in% vehicles.sccd,]

# Data for Baltimore is subset
baltimore.vehicles.neid <- vehicles.neid[vehicles.neid$fips==24510,]

g <- ggplot(
       baltimore.vehicles.neid, aes(factor(year), Emissions/1000)) +
       geom_bar(stat="identity") +
       labs(x="Year", y="Total PM2.5 emission (kilotons)") + 
       labs(title="PM2.5 Motor vehicle emissions in Baltimore from 1999-2008")
 
print(g)

# as can be observed clearly form the chart, emissions from motor vehicle sources have decreased
# steadly from 1999-2008 in Baltimore City, MD