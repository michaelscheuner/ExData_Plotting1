setwd("~/coursera")

df <- read.csv2("household_power_consumption.txt",sep=";", colClasses=rep("character",9))
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df = subset(df, df$Date == as.Date("2007-02-02") | df$Date == as.Date("2007-02-01") )
df$"Global_active_power" = as.numeric(df$"Global_active_power")

png(file="plot1.png", width=480,height=480,units="px")

hist(df$"Global_active_power", 
     main = "Global Active Power", 
     col="red", 
     xlab="Global Active Power (kilowatts)")

dev.off()


