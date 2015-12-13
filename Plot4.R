project1 <- read.table("C:/Users/Z/Desktop/project1/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
project1 <- transform(project1, Date2 = as.Date(Date, "%d/%m/%Y"))
project1_dates <- subset(project1, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))
project1_dates <- transform(project1_dates, DateTime = strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))
plot1 <- function() {with(project1_dates, plot(DateTime, Global_active_power, type = 'l', ylab = "Global Active Power (kilowatts)", xlab = ""))}
plot2 <- function () {with(project1_dates, plot(DateTime, Sub_metering_1, type = 'l', ylab = "Energy sub metering", xlab = ""))
  lines(project1_dates$DateTime, project1_dates$Sub_metering_2, col = "red")
  lines(project1_dates$DateTime, project1_dates$Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))}
plot3 <- function () {with(project1_dates, plot(DateTime, Voltage, type = 'l', ylab = "Voltage", xlab = "datetime"))}
plot4 <- function () {with(project1_dates, plot(DateTime, Global_reactive_power, type = 'l', ylab = "Global_reactive_power", xlab = "datetime"))}
png(filename = "Plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
plot1()
plot2()
plot3()
plot4()
dev.off()
