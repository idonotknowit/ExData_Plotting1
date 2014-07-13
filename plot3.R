rm(list=ls())

power_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

good_data <- power_data[with(power_data, Date=="1/2/2007" | Date=="2/2/2007"), ]

points(x,y[g=="Sub_metering_2"],col="red",type="l",ylim=range(c(good_data$Sub_metering_1,good_data$Sub_metering_2,good_data$Sub_metering_3)))
x = 1:2880;

plot (x, y= good_data$Sub_metering_1,type ="l",
      xlab ="",
      ylab = "Energy sub metering")
## add additional lines
lines (x, y= good_data$Sub_metering_2, col ="red")
lines (x, y= good_data$Sub_metering_3, col ="blue")
## Add Legend 
dev.copy(png,'plot3.png')
axis(1, at=c(1,nrow(good_data)/2,nrow(good_data)),labels=c("Thu","Fri","Sat"))
legend("topright" , c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3")) # puts text in the legend 
dev.off()
