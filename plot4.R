
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
png(filename = "Plot4.png", width = 480, height = 480, units = "px")

# Plot 4
par(mfrow = c(2,2))

plot(data$Date_Time ,data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatt)", xlab = "" )

plot(data$Date_Time ,data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime" )

plot(data$Date_Time ,data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(data$Date_Time, data$Sub_metering_2, col = "red")
lines(data$Date_Time, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1,col = c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.5)

plot(data$Date_Time ,data$Voltage, type = "l", ylab = "Global reactive power", xlab = "datetime" )

dev.off()


