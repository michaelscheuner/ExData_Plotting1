setwd("~/coursera")

df <- read.csv2("household_power_consumption.txt",sep=";", colClasses=rep("character",9))
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df = subset(df, df$Date == as.Date("2007-02-02") | df$Date == as.Date("2007-02-01") )
df$"Global_active_power" = as.numeric(df$"Global_active_power")
df$datetime <- as.POSIXlt(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

png(file="plot2.png", width=480,height=480,units="px")

plot (df$datetime, df$"Global_active_power", type="l", 
      ylab="Global Active Power (kilowatts)",
      xlab="")

dev.off()

