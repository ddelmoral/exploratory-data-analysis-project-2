# plot4.R 
# Exploratory Data Analysis - Course Project 2
# David del Moral (david.delmoral@gmail.com)
# 
# Question 4
# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008?


# Load required libraries
library(dplyr)
library(ggplot2)

# Setting the working directory. It must exists to run this script.
setwd("C:/Users/ddelmoral/Documents/Personal/Learning/Exploratory Data Analysis/project2")

# Reading data files
neid <- readRDS("summarySCC_PM25.rds")
sccd <- readRDS("Source_Classification_Code.rds")

# combustion data is segregated
combustion.related  <- grepl("comb", sccd$SCC.Level.One, ignore.case=TRUE)
coal.related        <- grepl("coal", sccd$SCC.Level.Four, ignore.case=TRUE) 
coal.combustion     <- (combustion.related & coal.related)
combustion.sccd     <- sccd[coal.combustion,]$SCC
combustion.neid     <- neid[neid$SCC %in% combustion.sccd,]

g <-  ggplot(combustion.neid, aes(factor(year), Emissions/1000)) +
      geom_bar(stat="identity") +
      labs(x="Year", y="Total PM2.5 emissions (kilotons)") + 
      labs(title="Coal combustion related emissions, all US from 1999-2008")

print(g)

# as can be observed form the chart, coal emissions have decreased but not steadily 