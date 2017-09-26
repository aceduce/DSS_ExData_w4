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
EM_bal <- subset(EM, fips=="24510")
EM_la<-subset(EM, fips == "06037")
EM_bal$city<-"Baltimore"
EM_la$city<-"Los Angeles"
EM<-rbind(EM_bal,EM_la)


#alternative using ggplot

png("plot6.png",width=480,height=480,units="px",bg="transparent")

ggp <- ggplot(EM, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title="PM 2.5 Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008")

print(ggp)

dev.off()




