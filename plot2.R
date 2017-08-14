#Get the column classes 
setwd("/Users/faithlee/Downloads")
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, nrows=10)
classes<-sapply(data, class)
header<-colnames(data)

# B. Since the first line reads from 16/12/2006 17:24:00, then we can skip 66637 lines 
# and read the next 1440 lines 
data_subset<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, skip = 66636, nrows = 2880)
colnames(data_subset)<-header

data_subset$Date<-as.Date(data_subset$Date, "%d/%m/%Y")
x<-paste(data_subset$Date, data_subset$Time)
y<-strptime(x, "%Y-%m-%d %H:%M:%S")
png("plot2.png", width = 480, height = 480, units = "px")
plot(y, data_subset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()
