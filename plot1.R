#Get the column classes 
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, nrows=10)
classes<-sapply(data, class)
header<-colnames(data)

# Two methods : 
# A. Read in Data and subset those two days 
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, colClasses = classes)
data_subset<-subset(data, Date == "1/2/2007" | Date =="2/2/2007")

# OR 

# B. Since the first line reads from 16/12/2006 17:24:00, then we can skip 66637 lines 
# and read the next 1440 lines 
data_subset<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, skip = 66636, nrows = 2880)
colnames(data_subset)<-header

# First plot is a frequency plot of global active power 

png("plot1.png", width = 480, height = 480, units = "px")
hist(data_subset$Global_active_power, col = "red", main  = " Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
