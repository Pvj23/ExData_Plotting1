##Loading data

library(readr)

power <- read_csv2("household_power_consumption.txt", col_name = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), skip = 66637, n_max = 2880)

library(lubridate)

power$Date <-as.Date(power$Date, format = "%d/%m/%Y")


power$Global_active_power <- as.numeric(power$Global_active_power)


##date conversion

datetime <- paste(as.Date(power$Date), power$Time)

power$Date <- as.POSIXct(datetime)


##Generating the plot
with(power, {
    plot(Sub_metering_1 ~ Date, type = "l", 
         ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ Date, col = 'Red')
    lines(Sub_metering_3 ~ Date, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Creating png file

dev.copy(png, file = "plot3.png", width=480, height=480)

dev.off()
