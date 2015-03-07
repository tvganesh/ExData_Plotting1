#plot2.R - Plot the global active power 
setwd("C:\software\R\coursera\exploratory-data-science\project\ExData_Plotting1")
epc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",
                dec=".", sep=";",colClasses = c(rep("character",2), rep("numeric",7)))

# Subset to only read for the specified dates
epc07 <- epc[epc$Date =="1/2/2007" | epc$Date == "2/2/2007",]

#Create new column
epc07$DateTime<-strptime(paste(epc07$Date,epc07$Time),"%d/%m/%Y %H:%M:%S")

# Convert to POSIX format
epc07$DateTime <- as.POSIXct(epc07$DateTime)

# Plot 2
epc07$DateTime <- as.POSIXct(epc07$DateTime)
png("plot2.png")
plot(epc07$DateTime, epc07$Global_active_power,pch=".",xlab="",
            ylab="Global Active Power (kilowatts)", main="")
lines(epc07$DateTime, epc07$Global_active_power)
dev.off()
