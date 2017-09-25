rm(list = ls())
#set working directory
setwd("D:/Coursera/DS/Exploratory/DSS_Exp_w4")
getwd()
if(!file.exists("data")) {
  dir.create("data")
}
#file handling

fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileURL, destfile="./data/rawdata.zip")
fileloc<-paste(getwd(),"/data/rawdata.zip",sep="")

s<-unzip(fileloc,list=F,exdir = getwd(), overwrite = T)

flist = list.files(path=getwd(),pattern = ".*.rds")

flist<-paste(getwd(),flist,sep = "/")

## This first line will likely take a few seconds. Be patient!
SCC<-readRDS(flist[1])
NEI<-readRDS(flist[2])
head(SCC)
head(NEI)
unique(NEI$year)
#make names, can be skipped if want to 
names(SCC) <- make.names(names(SCC))
EM<-with(NEI, tapply(Emissions, year, sum))

#plot 1 Use Barplot from base plot system

#subset to get only btw 2007-02-01 and 2007-02-02

png("plot1.png",width=480,height=480,units="px",bg="transparent")

barplot(
  (EM)/10^6,
  names.arg=names(EM),
  xlab="Year",
  ylab="PM2.5 Emissions (million Tons)",
  col="Blue",
  main="Total PM2.5 Emissions From All US Sources"
)

dev.off()

#alternative use following for png:
#dev.copy(png, file = "plotx.png", height = 480, width = 480)
#dev.off()

#alternative use aggregate functions:
#agr<-aggregate(Emissions ~ year, NEI, sum)

