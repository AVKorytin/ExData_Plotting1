
#Reading data
#-------------------------------------------------------------------------------

#"household_power_consumption.txt" file should be in your working directory
UCI_data <- read.table("household_power_consumption.txt", header = TRUE, sep=";",
                       na.strings = "?", stringsAsFactors = FALSE)

#Using data from the dates 2007-02-01 and 2007-02-02
#dplyr package is required
UCI_data_subset <- dplyr::filter(UCI_data, Date %in% c("1/2/2007", "2/2/2007"))
UCI_data_subset$Date_and_time <- strptime(paste(UCI_data_subset$Date, UCI_data_subset$Time),
                                          "%d/%m/%Y %H:%M:%S", tz = "UTC")

#-------------------------------------------------------------------------------

#Plot 4
#Multiple plot
par(mfcol = c(2, 2))

#First plot
with(UCI_data_subset, plot(Date_and_time, Global_active_power, type = "l",
                           ylab = "Global Active Power (kilowatts)", xlab = ""))

#Second plot
with(UCI_data_subset, plot(Date_and_time, Sub_metering_1, type = "n",
                           ylab = "Energy sub metering", xlab = ""))
with(UCI_data_subset, lines(Date_and_time, Sub_metering_1))
with(UCI_data_subset, lines(Date_and_time, Sub_metering_2, col = "red"))
with(UCI_data_subset, lines(Date_and_time, Sub_metering_3, col = "blue"))
legend("topright", lty = "solid", lwd = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Third plot
with(UCI_data_subset, plot(Date_and_time, Voltage, type = "l", xlab = "datetime"))

#Fourth plot
with(UCI_data_subset, plot(Date_and_time, Global_reactive_power, type = "l", xlab = "datetime"))

#Creating png file
dev.copy(png, file = "plot4.png")
dev.off()


