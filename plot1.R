
library(data.table)

#load the data
datadir <- "C:/Users/Alexandra/Documents/Uni/QBER_Work/PHD_Studies/Data Sience/Explorative_Data/Week1"
data<-as.data.table(read.table( paste0(datadir, "/household_power_consumption.txt"), na.strings = "?", sep = ";", header = TRUE))

#Date as date as POSIXlt
data[,Date:=as.Date(Date, format = "%d/%m/%Y")]
data[,Date_Time:=paste(Date,Time)]
data[,Date_Time:=strptime(Date_Time, format = "%Y-%m-%d %H:%M:%S")]

# take the 2 days sample
data <- data[Date%in%c(as.Date("2007-02-01"),as.Date("2007-02-02")),]


wdirr <- "C:/Users/Alexandra/Documents/Uni/QBER_Work/PHD_Studies/Data Sience/Explorative_Data/Week1/ExData_Plotting1-master"
setwd(wdirr)
png(filename = "Plot1.png", width = 480, height = 480, units = "px")

#Plot1
hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatt)", main = "Global Active Power")

dev.off()

