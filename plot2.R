setwd("~/Documents/Coursera/Exploratory data analysis")
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url=url,destfile="project1.zip",method="curl")
unzip("project1.zip")
data<-read.table("household_power_consumption.txt",nrows=3)
data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
head(data)
data1<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
head(data1)

data1$Date_Time<-strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")
head(data1)
png("plot2.png",width = 480, height = 480)
plot(data1$Date_Time,data1$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
