#for home:
#directoryBase <- "C:/Documents and Settings/brian/My Documents/My Data Sources/MOOC/coursera computing data science/ProgAssign2/"    
#for campus:
#
directoryBase <- "I:\\My Data Sources\\coursera\\Computing for Data analysis\\"    
setwd(directoryBase)
count<-function(cause){
  homicides <- readLines("homicides.txt")
  causes.list<-c("asphyxiation" ,"blunt force","other","shooting","stabbing","unknown")
  if (!cause %in% causes.list){stop("invalid cause")  }
  count<-length(grep(paste0("cause: ",cause),homicides, ignore.case=T))
  return(count)
       
}
