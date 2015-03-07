#plot3.R 
setwd("C:\software\R\coursera\exploratory-data-science\project\ExData_Plotting1")
# Read file
epc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",
                dec=".", sep=";",colClasses = c(rep("character",2), rep("numeric",7)))
# Subset to only read for the specified dates
epc07 <- epc[epc$Date =="1/2/2007" | epc$Date == "2/2/2007",]

#Create new column
epc07$DateTime<-strptime(paste(epc07$Date,epc07$Time),"%d/%m/%Y %H:%M:%S")

epc07$DateTime <- as.POSIXct(epc07$DateTime)

# Plot 2
epc07$DateTime <- as.POSIXct(epc07$DateTime)

png("plot3.png")
plot(epc07$DateTime, epc07$Sub_metering_1, pch=".",xlab="",
     ylab="Energy sub metering", main="")
lines(epc07$DateTime, epc07$Sub_metering_1,col="black")
lines(epc07$DateTime, epc07$Sub_metering_2,col="blue")
lines(epc07$DateTime, epc07$Sub_metering_3,col="red")

#Add legend
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_2"), lty=c(1,1,1),   
       lwd=c(2,2,2),col=c( "black", "blue", "red"),bty="n") 
dev.off()
