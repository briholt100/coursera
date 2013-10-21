library(lattice)
#for home:
#
directoryBase <- "C:/Documents and Settings/brian/My Documents/My Data Sources/MOOC/coursera computing data science/ProgAssign2/"    
#for campus:
#  directoryBase <- "I:\\My Data Sources\\coursera\\Computing for Data analysis\\"    
setwd(directoryBase)
hospital<-read.csv(file=paste0(directoryBase,"hospital-data.csv"),header=T)
outcomes<-read.csv(file=paste0(directoryBase,"outcome-of-care-measures.csv"),colClasses="character")


outcomes<-read.csv(file=paste0(directoryBase,"outcome-of-care-measures.csv"),colClasses="character")

outcomes[, 11] <- as.numeric(outcomes[, 11])
outcomes[, 17] <- as.numeric(outcomes[, 17])
outcomes[, 23] <- as.numeric(outcomes[, 23])

outcome.hospital <- merge(outcomes, hospital, by = "Provider.Number")

death <- as.numeric(outcome.hospital[, 11]) ## Heart attack outcome
npatient <- as.numeric(outcome.hospital[, 15])
owner <- factor(outcome.hospital$Hospital.Ownership)

