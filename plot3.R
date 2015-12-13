# Set my date format dd/mm/yyyy
setAs("Date","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

# Read file data
pConsumption <- read.table("./data/household_power_consumption.txt", 
                           header = TRUE, sep = ";", 
                           colClasses = c("myDate", "character", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric" ), 
                           na.strings = "?")

# Get subset for Plot
pConDat <- pConsumption[pConsumption$Date %in% c(as.Date("2007-02-01"), 
                                                 as.Date("2007-02-02")),]


dateTime <- as.POSIXct(paste(pConDat$Date, pConDat$Time, sep = " "))


# Create PNG output
png("plot3.png", width = 480, height = 480)                                                 

# Line Plot 
plot(dateTime, pConDat$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(dateTime, pConDat$Sub_metering_2, col = "red")
lines(dateTime, pConDat$Sub_metering_3, col = "blue")

# Legend
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend =  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()