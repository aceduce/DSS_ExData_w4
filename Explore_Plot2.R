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
NEI_bal<-subset(NEI,fips=="24510",c(Emissions, year))
EM_bal<-with(NEI_bal, tapply(Emissions, year, sum))

png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(
  (EM_bal)/10^6,
  names.arg=names(EM_bal),
  xlab="Year",
  ylab="PM2.5 Emissions (milion Tons)",
  col="Blue",
  main="Total PM2.5 Emissions From Baltimore only"
)

dev.off()



