#set working directory on computerLoadfile
library(dplyr)
library(data.table)

setwd("C:/")
setwd("C:/Users/chris/Desktop/Coursera/ExplortoryAnalysis/Wk1project")
hpc <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings ="?",
                   stringsAsFactors = FALSE)

dim(hpc) # 2075259 rows, 9 column
str(hpc) # checked structure
head(hpc) # explored top level rows
names(hpc) # just a look at regular names of columns


hhpc <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
    hhpc$DateTime <- strptime(paste(hhpc$Date, hhpc$Time, sep = ""), "%d/%m/%Y %H:%M:%S") 
    globalActivePower <- as.numeric(hhpc$Global_active_power)

dim(hhpc) # extracted subset 2880 rows, 10 columns


# Plot 2

png("plot2.png", width=480, height=480)

plot(hhpc$DateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

