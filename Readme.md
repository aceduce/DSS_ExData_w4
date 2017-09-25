## Readme

This piece includes 6 plots for the problem set assignments from Exploratory session in Coursera. 

### Background
Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the EPA National Emissions Inventory web site.

### Assigment requests:
You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

## Plot 1
1. Used `read.RDS()` to read RDS files. `tapply` to organize the table. alternative is `aggregate(formula, data, fun)` where `formulat` is in `Emissions ~ year`

2. Create png file through `png("plot1.png",width=480,height=480,units="px",bg="transparent")`
Alternative could be 
```#dev.copy(png, file = "plotx.png", height = 480, width = 480)```
```#dev.off()```
3. Barplot is used here. One of the plots for base plot system.

## Plot 2

subset the data frame with `subset(df, selected column values, c(a,b,...))`

## Plot 3



## Data source: 
https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

#### refernece work
https://github.com/wayneeseguin/exdata-project2