
setwd("C:/")
setwd("C:/Users/chris/Desktop/Coursera/ExplortoryAnalysis/Wk1project")
hpc <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings ="?",
                   stringsAsFactors = FALSE,
                   comment.char="")

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

# Subset 

hpc <- subset(hpc, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%Y-%m-%d %H:%M:%S")
hpc$datetime <- as.POSIXct(hpc$datetime)


# Plot 3

png("plot3.png", width=480, height=480)

plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()
