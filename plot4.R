data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                   stringsAsFactors = FALSE, dec=".")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
datasubset <- subset(data,Date=="2007-02-01" | Date=="2007-02-02")
datasubset$DateTime <- paste(datasubset$Date,datasubset$Time)
datasubset$DateTime <- strptime(datasubset$DateTime,"%Y-%m-%d %T")
datasubset$Global_active_power[datasubset$Global_active_power=="?"] <- NA
datasubset$Global_active_power <- as.numeric(datasubset$Global_active_power)
datasubset$Voltage[datasubset$Voltage=="?"] <- NA
datasubset$Voltage <- as.numeric(datasubset$Voltage)
datasubset$Sub_metering_1[datasubset$Sub_metering_1=="?"] <- NA
datasubset$Sub_metering_2[datasubset$Sub_metering_2=="?"] <- NA
datasubset$Sub_metering_3[datasubset$Sub_metering_3=="?"] <- NA
datasubset$Sub_metering_1 <- as.numeric(datasubset$Sub_metering_1)
datasubset$Sub_metering_2 <- as.numeric(datasubset$Sub_metering_2)
datasubset$Sub_metering_3 <- as.numeric(datasubset$Sub_metering_3)
datasubset$Global_reactive_power[datasubset$Global_reactive_power=="?"] <- NA
datasubset$Global_reactive_power <- as.numeric(datasubset$Global_reactive_power)

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(datasubset$DateTime,datasubset$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

plot(datasubset$DateTime,datasubset$Voltage, type="l", xlab="datetime",
     ylab="Voltage")

plot(datasubset$DateTime,datasubset$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(datasubset$DateTime,datasubset$Sub_metering_2, col="red")
lines(datasubset$DateTime,datasubset$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black","red","blue"),bty="n")

plot(datasubset$DateTime,datasubset$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

dev.off()
