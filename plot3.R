getwd()

hpc <- read.table("C:/R_test/coursera/data/household_power_consumption.txt", header=T, sep=";")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
a <- hpc[(hpc$Date=="2007-02-01") | (hpc$Date=="2007-02-02"),]
a$Global_active_power <- as.numeric(as.character(a$Global_active_power))
a$Global_reactive_power <- as.numeric(as.character(a$Global_reactive_power))
a$Voltage <- as.numeric(as.character(a$Voltage))
a <- transform(a, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
a$Sub_metering_1 <- as.numeric(as.character(a$Sub_metering_1))
a$Sub_metering_2 <- as.numeric(as.character(a$Sub_metering_2))
a$Sub_metering_3 <- as.numeric(as.character(a$Sub_metering_3))

plot3 <- function() {
  plot(a$timestamp,a$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(a$timestamp,a$Sub_metering_2,col="red")
  lines(a$timestamp,a$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), 
         c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
  cat("plot3.png has been saved in", getwd())
}
plot3()