#plot1 R - Plots the histogram
# Read the household power consumption file
setwd("C:\software\R\coursera\exploratory-data-science\project\ExData_Plotting1")
epc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",
                dec=".", sep=";",colClasses = c(rep("character",2), rep("numeric",7)))

# Subset to only read for the specified dates
epc07 <- epc[epc$Date =="1/2/2007" | epc$Date == "2/2/2007",]

#Create new column
epc07$DateTime<-strptime(paste(epc07$Date,epc07$Time),"%d/%m/%Y %H:%M:%S")

png("plot1.png")
# Plot a histogram
hist(epc07$Global_active_power,col="red", xlab="Global Active Power(kilowatts)",
         ylab="Frequency", main="Global Active Power")
dev.off()

