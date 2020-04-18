
setwd("C:/")
setwd("C:/Users/chris/Desktop/Coursera/ExplortoryAnalysis/Wk1project")
hpc <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings ="?",
                   stringsAsFactors = FALSE, dec="."
                 )
hpc<-tbl_df(hpc)
hhpc<-subset(hpc,hpc$Date=="1/2/2007"| hpc$Date=="2/2/2007")
globalActivePower <- as.numeric(as.character(hhpc$Global_active_power))
voltage <- as.numeric(as.character(hhpc$Voltage))
hhpc$Sub_Metering_1 <- as.numeric(hhpc$Sub_metering_1)
hhpc$Sub_Metering_2 <- as.numeric(hhpc$Sub_metering_2)
hhpc$Sub_Metering_3 <- as.numeric(hhpc$Sub_metering_3)
hhpc$Global_reactive_power <- as.numeric(as.character(hhpc$Global_reactive_power))

# Plot and save the .png file

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, hhpc$Sub_Metering_1, type="l",xlab="", ylab="Energy Sub_metering",
     col="green",
     ylim=c(0,40))

par(new=TRUE)
    plot(datetime, hhpc$Sub_Metering_2, type="l", xlab="", ylab="",
         col="red",
         ylim=c(0,40))
    
par(new=TRUE)
    plot(datetime, hhpc$Sub_Metering_3, type="l", xlab="", ylab="",
         col="blue",
        ylim=c(0,40))
    
    legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        lty = 1,lwd = 2.5, col=c("green","red","blue"),cex=0.5)

plot(datetime, hhpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()







