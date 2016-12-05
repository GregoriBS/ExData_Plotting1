data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                   stringsAsFactors = FALSE, dec=".")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
datasubset <- subset(data,Date=="2007-02-01" | Date=="2007-02-02")
datasubset$Global_active_power[datasubset$Global_active_power=="?"] <- NA
datasubset$Global_active_power <- as.numeric(datasubset$Global_active_power)

png("plot1.png", width=480, height=480)

hist(datasubset$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()
