#Get the column classes 
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, nrows=10)
classes<-sapply(data, class)
header<-colnames(data)

# B. Since the first line reads from 16/12/2006 17:24:00, then we can skip 66637 lines 
# and read the next 1440 lines 
data_subset<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, skip = 66636, nrows = 2880)
colnames(data_subset)<-header

#The plot 
data_subset$Date<-as.Date(data_subset$Date, "%d/%m/%Y")
x<-paste(data_subset$Date, data_subset$Time)
y<-strptime(x, "%Y-%m-%d %H:%M:%S")
png("plot2.png", width = 480, height = 480, units = "px")
plot(y, data_subset$Sub_metering_1, type = "l", ylab = "Energy Sub Metering", col = "black", xlab = "")
points(y, data_subset$Sub_metering_2, type = "l", col = "red")
points(y, data_subset$Sub_metering_3, type = "l", col = "blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()
