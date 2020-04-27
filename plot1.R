##Loading data

library(readr)

power <- read_csv2("household_power_consumption.txt", col_name = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), skip = 66637, n_max = 2880)

library(lubridate)

power$Date <-dmy(power$Date)


power$Global_active_power <- as.numeric(power$Global_active_power)

##Ploting the histogram

hist(power$Global_active_power, col = "red", main = "Global Active power", xlab = "Global Active power(kilowatts)")

##Creating png file

png("plot1.png", width=480, height=480)

dev.off()
