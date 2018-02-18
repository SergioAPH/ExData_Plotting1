#1.0 Reading Table
# The function readweek1 is used  to extract the data points for 
# 01/02/2007-02/02/2007
# Starting from the unzipping the file given in the coursera page, 
# "household_power_consumption.txt" must be in our working directory
readweek1<-function(){
  W1Pr<-read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings= "?")
  W1Pr$Date<-as.Date(as.character(W1Pr$Date), "%d/%m/%Y" )
  subsetbydate<-c(grep("2007-02-01", W1Pr$Date), 
                  grep("2007-02-02", W1Pr$Date))
  W1Pr<-W1Pr[subsetbydate,]
}
W1Pr<-readweek1()

# subsetbydate is an auxiliary column vector of indices
# for the dates looked for with grep() in "%Y-%m-%d" format.
#1.1 Pasting Date & Time
library("lubridate")
timezone<- Sys.timezone(location = TRUE)
daytime<-ymd_hms(paste(W1Pr$Date[1],W1Pr$Time[1]), tz =timezone)
#Couldn't find a way to get in on the for loop
for(i in 2:length(W1Pr$Date)){
  daytime<-c(daytime,(ymd_hms(paste(W1Pr$Date[i],W1Pr$Time[i]), tz =timezone)))
}
#2.3 Plot #3
plot(daytime, W1Pr$Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering")
lines(daytime, W1Pr$Sub_metering_2, col="red")
lines(daytime, W1Pr$Sub_metering_3, col="blue")
dev.copy(png, file ="plot3.png")
dev.off()
