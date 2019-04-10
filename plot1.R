# Reading the dataset:
file_path <- "household_power_consumption.txt"
dataset <- read.csv(file = file_path, sep=';', na.strings = c("?")) # missing values are coded as ?
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
dataset <- dataset[dataset$Date >= "2007-02-01" & dataset$Date <= "2007-02-02",] # We will only be using data from the dates 2007-02-01 and 2007-02-02

# Exporting histogram to PNG:
png("plot1.png", width=480, height=480)
hist(dataset$Global_active_power, col='red', main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()