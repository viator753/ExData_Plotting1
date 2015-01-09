##Creates PNG histogram of Global Active Power for 02/01/2007-02/02/2007

#Read data into data table
powCon <- fread("household_power_consumption.txt", nrows=2880, skip="1/2/2007")
powConNames <- names(fread("household_power_consumption.txt", nrows=1))
setnames(powCon, powConNames)

#Create graph
png(filename = "plot1.png")
with(powCon, hist(Global_active_power, col="red", main="Global Active Power",
              xlab="Global Active Power (kilowatts)"))
dev.off()