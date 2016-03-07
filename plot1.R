datfile <-"./household_power_consumption.txt"
data <- read.table(datfile, header = TRUE, sep = ";", stringsAsFactors = FALSE)
plotdata <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
plotdata$Date <- as.Date(plotdata$Date, format = "%d/%m/%Y")
hist(as.numeric(plotdata$Global_active_power), col = "RED", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.copy(png, "./plot1.png")
dev.off()