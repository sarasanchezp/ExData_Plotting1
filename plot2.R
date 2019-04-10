Sys.setlocale("LC_TIME", "C")

# Reading the dataset:
file_path <- "household_power_consumption.txt"
dataset <- read.csv(file = file_path, sep=';', na.strings = c("?")) # missing values are coded as ?
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
dataset <- dataset[dataset$Date >= "2007-02-01" & dataset$Date <= "2007-02-02",] # We will only be using data from the dates 2007-02-01 and 2007-02-02
dataset$datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S")

# Exporting plot to PNG:
png("plot2.png", width=480, height=480)
plot(dataset$datetime, dataset$Global_active_power, type = "s", ylab="Global Active Power (kilowatts)",xlab="")
dev.off()