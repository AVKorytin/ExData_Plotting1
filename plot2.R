
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

#Plot 2
#Time series for Global Active Power
par(mar = c(5, 5, 4, 1.5))
with(UCI_data_subset, plot(Date_and_time, Global_active_power, type = "l",
                           ylab = "Global Active Power (kilowatts)", xlab = ""))

#Creating png file
dev.copy(png, file = "plot2.png")
dev.off()
