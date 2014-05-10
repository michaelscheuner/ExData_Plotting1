setwd("~/coursera")

df <- read.csv2("household_power_consumption.txt",sep=";", colClasses=rep("character",9))
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df = subset(df, df$Date == as.Date("2007-02-02") | df$Date == as.Date("2007-02-01") )
df$"Global_active_power" = as.numeric(df$"Global_active_power")
df$datetime <- as.POSIXlt(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

png(file="plot4.png", width=480,height=480,units="px")

par(mfrow=c(2,2))

# Plot 1
plot (df$datetime, df$"Global_active_power", type="l", 
      ylab="Global Active Power",
      xlab="")

# Plot 2
plot (df$datetime, df$"Voltage", type="l", 
      ylab="Voltage",
      xlab="datetime")

# Plot 3
plot(df$datetime, df$"Sub_metering_1", type="l", 
               ylab="Energy sub Metering",
               xlab="", col="black")
lines(df$datetime, df$"Sub_metering_2", col="red")
lines(df$datetime, df$"Sub_metering_3", col="blue")
legend("topright", 
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ), 
       lwd=1, bty="n")

# Plot 4
plot (df$datetime, df$"Global_reactive_power", type="l", 
      ylab="Global_reactive_power",
      xlab="datetime")

dev.off()
