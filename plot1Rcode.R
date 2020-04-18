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
hhpc$Date <- as.Date(hhpc$Date, format="%d/%m/%Y")

   Dim(hhpc) # extracted subset 2880 rows, 9 columns

# Plot 1

hist(hhpc$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


#png("plot1.png", width=480, height=480)

png("plot1.png", width=480, height=480)
   dev.off()


