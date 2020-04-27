##Loading data

library(readr)

power <- read_csv2("household_power_consumption.txt", col_name = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), skip = 66637, n_max = 2880)

library(lubridate)

power$Date <-as.Date(power$Date, format = "%d/%m/%Y")


power$Global_active_power <- as.numeric(power$Global_active_power)

power$Global_reactive_power <- as.numeric(power$Global_reactive_power)


##date conversion

datetime <- paste(as.Date(power$Date), power$Time)

power$Date <- as.POSIXct(datetime)


##Generating the plots

par(mfrow = c(2,2), mar = c(4,4,2,1))

with(power, {
    plot(Global_active_power ~ Date, type = "l", 
         ylab = "Global Active Power", xlab = "")
    plot(Voltage ~ Date, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(Sub_metering_1 ~ Date, type = "l", ylab = "Energy sub metering",
         xlab = "")
    lines(Sub_metering_2 ~ Date, col = 'Red')
    lines(Sub_metering_3 ~ Date, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
           bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ Date, type = "l", 
         ylab = "Global_rective_power", xlab = "datetime")
})

##Creating png file

dev.copy(png, file = "plot4.png", width=480, height=480)

dev.off()

