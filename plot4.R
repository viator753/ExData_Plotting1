##Creates PNG four-pane graph for 02/01/2007-02/02/2007

#Read data into data table, make data frame
powCon <- fread("household_power_consumption.txt", nrows=2880, skip="1/2/2007")
powConNames <- names(fread("household_power_consumption.txt", nrows=1))
setnames(powCon, powConNames)
powCon <- as.data.frame(powCon)

#Convert date/time, new column
powCon$datetime <- as.POSIXct(paste(powCon$Date, powCon$Time), format="%d/%m/%Y %H:%M:%S")

#Create four-pane graph
png(filename="plot4.png")
par(mfcol = c(2,2))
with(powCon,{
      plot(datetime, Global_active_power, type="l",
            ylab="Global Active Power", xlab="")
      plot(datetime, Sub_metering_1, type="l",
            ylab="Energy sub metering", xlab="")
      lines(powCon$datetime, powCon$Sub_metering_2, col="red")
      lines(powCon$datetime, powCon$Sub_metering_3, col="blue")
      legend("topright", bty="n", lwd=1, col=c("black", "red", "blue"),
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      plot(datetime, Voltage, type="l")
      plot(datetime, Global_reactive_power, type="l")
      })
dev.off()