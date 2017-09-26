rm(list = ls())
#set working directory
setwd("C:/Users/IBM_ADMIN/Documents/Coursera/DataScienceSpec/Rprog/C4/DSS_Exploratory_w4/DSS_ExData_w4")
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
#NEI_bal<-subset(NEI,fips=="24510",c(Emissions, year, type))
#EM_bal<-with(NEI_bal, tapply(Emissions, year, sum))

vehicle=grep("vehicle",SCC$SCC.Level.Two, ignore.case = T)

vehicle<- SCC$SCC[vehicle]

EM <- subset(NEI, SCC %in% vehicle, c(fips, Emissions, year))
EM <- subset(EM, fips=="24510")

#alternative EM2<-EM[EM$fips=="24510",]

names(SCC) <- make.names(names(SCC))
EM<-with(EM, tapply(Emissions, year, sum))

png("plot5.png",width=480,height=480,units="px",bg="transparent")

#this is using the bas plot version
barplot(
  (EM)/10^3,
  names.arg=names(EM),
  xlab="Year",
  ylab="PM2.5 Emissions (thousand Tons)",
  col="Blue",
  main="Total PM2.5 Motor Vehicle Source Emissions in Baltimore from 1999-2008"
)

dev.off()


#alternative using ggplot

png("plot4b.png",width=480,height=480,units="px",bg="transparent")

ggp <- ggplot(com_coal_NEI,aes(factor(year),Emissions/10^6)) +
  geom_bar(stat="identity",fill="blue",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y="Total PM Emission (million Tons)") + 
  labs(title="Total PM2.5 Motor Vehicle Source Emissions in Baltimore from 1999-2008")

print(ggp)

dev.off()




