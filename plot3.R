data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                   stringsAsFactors = FALSE, dec=".")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
datasubset <- subset(data,Date=="2007-02-01" | Date=="2007-02-02")
datasubset$DateTime <- paste(datasubset$Date,datasubset$Time)
datasubset$DateTime <- strptime(datasubset$DateTime,"%Y-%m-%d %T")
datasubset$Sub_metering_1[datasubset$Sub_metering_1=="?"] <- NA
datasubset$Sub_metering_2[datasubset$Sub_metering_2=="?"] <- NA
datasubset$Sub_metering_3[datasubset$Sub_metering_3=="?"] <- NA
datasubset$Sub_metering_1 <- as.numeric(datasubset$Sub_metering_1)
datasubset$Sub_metering_2 <- as.numeric(datasubset$Sub_metering_2)
datasubset$Sub_metering_3 <- as.numeric(datasubset$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(datasubset$DateTime,datasubset$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(datasubset$DateTime,datasubset$Sub_metering_2, col="red")
lines(datasubset$DateTime,datasubset$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black","red","blue"))

dev.off()
