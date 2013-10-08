directoryBase <- "C:/Documents and Settings/brian/My Documents/My Data Sources/MOOC/coursera computing data science/ProgAssign2/"    
setwd(directoryBase)
hospitals<-read.csv(file=paste0(directoryBase,"hospital-data.csv"),header=T)
head(hospitals,19)

outcome<-read.csv(file=paste0(directoryBase,"outcome-of-care-measures.csv"),colClasses="character")
str(outcome)
head(outcome)

##Question 1, Histogram
outcome[,11]<-as.numeric(outcome[,11])
hist(outcome[,11],xlab="30-day Death Rate",main="Heart Attack 30-Day Rate")

##Question 2, do the same, but for 3 variables, HA, HF, Pneumonia (11, 17, 23)
#It seems like the hist code could be called by an apply funciton..but, whatever
outcome[,17]<-as.numeric(outcome[,17])
outcome[,23]<-as.numeric(outcome[,23])
par(mfrow=c(3,1)) #range(outcome[,11],na.rm=T)
hist(outcome[,11],xlab="30-day Death Rate",main="Heart Attack",xlim=c(0,20))
abline(v=median(outcome[,11],na.rm=T),col="blue", lwd=3)
hist(outcome[,17],xlab="30-day Death Rate",main="Heart Failure",xlim=c(0,20))
abline(v=median(outcome[,17],na.rm=T),col="blue", lwd=3)
hist(outcome[,23],xlab="30-day Death Rate",main="Pneumonia",xlim=c(0,20))
abline(v=median(outcome[,23],na.rm=T),col="blue", lwd=3)
#####NOte, he asks to add the mean to the title, as well as adding a smooth density estimate over the histogram

#quest 3