#1.0 Reading Table
# The function readweek1 is used  to extract the data points for 
# 01/02/2007-02/02/2007
# Starting from the .zip file given in the Coursera Page.
readweek1<-function(){
  W1Pr<-read.table(unz("Data.zip","household_power_consumption.txt"), header=TRUE, sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings= "?")
  W1Pr$Date<-as.Date(as.character(W1Pr$Date), "%d/%m/%Y" )
  subsetbydate<-c(grep("2007-02-01", W1Pr$Date), 
                  grep("2007-02-02", W1Pr$Date))
  W1Pr<-W1Pr[subsetbydate,]
}
W1Pr<-readweek1()
# The zip file was renamed to "Data.zip" and was relocated to
# the working directory.
# The file was read using read.table() aided by unz();
# subsetbydate is an auxiliary column vector of indices
# for the dates looked for with grep() in "%Y-%m-%d" format.

#2.0 Plotting
#2.1 Plot #1

hist(W1Pr$Global_active_power, col="red", main="Global Active Power", xlab=
       "Global Active Power(kilowatts)")
dev.copy(png, file ="plot1.png")
dev.off()
#the plot saved was already a 480x480 png file 
