data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                   stringsAsFactors = FALSE, dec=".")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
datasubset <- subset(data,Date=="2007-02-01" | Date=="2007-02-02")
datasubset$DateTime <- paste(datasubset$Date,datasubset$Time)
datasubset$DateTime <- strptime(datasubset$DateTime,"%Y-%m-%d %T")
datasubset$Global_active_power[datasubset$Global_active_power=="?"] <- NA
datasubset$Global_active_power <- as.numeric(datasubset$Global_active_power)

png("plot2.png", width=480, height=480)

plot(datasubset$DateTime,datasubset$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
