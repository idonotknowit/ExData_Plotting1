rm(list=ls())

power_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

good_data <- power_data[with(power_data, Date=="1/2/2007" | Date=="2/2/2007"), ]

with(good_data, plot(Global_active_power, type="l"))

dev.copy(png,'plot2.png')
axis(1, at=c(1,nrow(good_data)/2,nrow(good_data)),labels=c("Thu","Fri","Sat"))
dev.off()
