#  datfile <-"./household_power_consumption.txt"
# data <- read.table(datfile, header = TRUE, sep = ";", stringsAsFactors = FALSE)
  plotdata <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
  datetime <- strptime(paste(plotdata$Date, plotdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
  
  par(mfrow = c(2,2), mar=c(3,1,1,1), oma=c(0,2,0,0))
  
  ## Plot 1
  plot(datetime, as.numeric(plotdata$Global_active_power), type="l", xlab="", ylab="Global Active Power")
  
  ## Plot 2
  plot(datetime, as.numeric(plotdata$Voltage), type="l", ylab="Voltage")
  
  ## Plot 3
  plot(datetime, as.numeric(plotdata$Sub_metering_1), type = "l", xlab = " ", ylab = "Energy sub metering")
  lines(datetime, as.numeric(plotdata$Sub_metering_2), type = "l", col = "Red")
  lines(datetime, as.numeric(plotdata$Sub_metering_3), type = "l", col = "Blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("Black", "Red", "Blue"), bty = 'n')
  
  ## Plot 4
  plot(datetime, as.numeric(plotdata$Global_reactive_power), type="l", ylab="Global_reactive_power")
  
  dev.copy(png, "./plot4.png")
  dev.off()