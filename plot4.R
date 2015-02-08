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

plot4 <- function() {
  par(mfrow=c(2,2))
  
  ##PLOT 1
  plot(a$timestamp,a$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  ##PLOT 2
  plot(a$timestamp,a$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##PLOT 3
  plot(a$timestamp,a$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(a$timestamp,a$Sub_metering_2,col="red")
  lines(a$timestamp,a$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), 
         c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
         lty=c(1,1), bty="n", cex=.5) 
  
  #PLOT 4
  plot(a$timestamp,a$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  #OUTPUT
  dev.copy(png, file="plot4.png", width=500, height=500)
  dev.off()
  cat("plot4.png has been saved in", getwd())
}
plot4()