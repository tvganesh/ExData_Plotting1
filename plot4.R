#plot4.R
setwd("C:\software\R\coursera\exploratory-data-science\project\ExData_Plotting1")
epc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",
                dec=".", sep=";",colClasses = c(rep("character",2), rep("numeric",7)))

# Subset to only read for the specified dates
epc07 <- epc[epc$Date =="1/2/2007" | epc$Date == "2/2/2007",]

#Create new column
epc07$DateTime<-strptime(paste(epc07$Date,epc07$Time),"%d/%m/%Y %H:%M:%S")

epc07$DateTime <- as.POSIXct(epc07$DateTime)

# Create a 2 row x 2 column matrix for plots
png("plot4.png")

par(mfrow= c(2,2), mar=c(4,4,2,1))
#Plot individually
plot(epc07$DateTime, epc07$Global_active_power,pch=".",xlab="",
     ylab="Global Active Power (kilowatts)", main="")
lines(epc07$DateTime, epc07$Global_active_power)

plot(epc07$DateTime,epc07$Voltage, pch=".",xlab="datetime",
     ylab="Voltage", main="")
lines(epc07$DateTime,epc07$Voltage)


plot(epc07$DateTime, epc07$Sub_metering_1, pch=".",xlab="",
    ylab="Energy sub metering", main="")
lines(epc07$DateTime, epc07$Sub_metering_1,col="black")
lines(epc07$DateTime, epc07$Sub_metering_2,col="blue")
lines(epc07$DateTime, epc07$Sub_metering_3,col="red")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_2"), lty=c(1,1,1),   
       lwd=c(2,2,2),col=c( "black", "blue", "red"),bty="n")


plot(epc07$DateTime, epc07$Global_reactive_power,pch=".",xlab="",main="")
lines(epc07$DateTime, epc07$Global_reactive_power)

dev.off()
