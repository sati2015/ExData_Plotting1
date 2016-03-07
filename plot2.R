datfile <-"./household_power_consumption.txt"
data <- read.table(datfile, header = TRUE, sep = ";", stringsAsFactors = FALSE)
plotdata <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
datetime <- strptime(paste(plotdata$Date, plotdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
plot(datetime, as.numeric(plotdata$Global_active_power), type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.copy(png, "./plot2.png")
dev.off()