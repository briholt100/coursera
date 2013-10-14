#for home:
#directoryBase <- "C:/Documents and Settings/brian/My Documents/My Data Sources/MOOC/coursera computing data science/ProgAssign2/"    
#for campus:
#
directoryBase <- "I:\\My Data Sources\\coursera\\Computing for Data analysis\\"    
setwd(directoryBase)

homicides <- readLines("homicides.txt")
#homicides<-read.csv(file=paste0(directoryBase,"homicides.txt"),header=T)

#length(homicides)

#grep(causes.list,homicides, ignore.case=T)

count<-function(cause){
  causes.list<-c("asphyxiation" ,"blunt force","other","shooting","stabbing","unknown")
  if (!cause %in% causes.list){stop("invalid cause")  }
  
  for (i in length(homicides)){
    count<-as.integer(length(grep(cause,homicides, ignore.case=T)) )
    
  }     
     
}