##Creates PNG line graph of Global Active Power for 02/01/2007-02/02/2007

#Read data into data table, make data frame
powCon <- fread("household_power_consumption.txt", nrows=2880, skip="1/2/2007")
powConNames <- names(fread("household_power_consumption.txt", nrows=1))
setnames(powCon, powConNames)
powCon <- as.data.frame(powCon)

#Convert date/time, new column
powCon$datetime <- as.POSIXct(paste(powCon$Date, powCon$Time), format="%d/%m/%Y %H:%M:%S")

#Create graph
png(filename="plot2.png")
with(powCon, plot(datetime, Global_active_power, type="l",
                  ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()