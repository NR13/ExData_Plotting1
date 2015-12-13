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


# Create PNG output
png("plot1.png", width = 480, height = 480)                                                 

# Plot Histogram
hist(pConDat$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",col = "red")

dev.off()