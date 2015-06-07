
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

#Plot 1
#Histogram for Global Active Power
hist(UCI_data_subset$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

#Creating png file
dev.copy(png, file = "plot1.png")
dev.off()
