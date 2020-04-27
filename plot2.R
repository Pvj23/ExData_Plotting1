##Loading data

library(readr)

power <- read_csv2("household_power_consumption.txt", col_name = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), skip = 66637, n_max = 2880)

library(lubridate)

power$Date <-as.Date(power$Date, format = "%d/%m/%Y")


power$Global_active_power <- as.numeric(power$Global_active_power)


##date conversion

datetime <- paste(as.Date(power$Date), power$Time)

power$Date <- as.POSIXct(datetime)

##plotting

plot(power$Global_active_power ~ power$Date, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

##Creating png file

png("plot2.png", width=480, height=480)

dev.off()
