#for home:
#
directoryBase <- "C:/Documents and Settings/brian/My Documents/My Data Sources/MOOC/coursera computing data science/ProgAssign2/"    
setwd(directoryBase)
#for campus:

agecount<-function(age=NULL){
  if (is.null(age)){stop("invalid age")}
  homicides <- readLines("homicides.txt")
  age.list<-length(grep(paste0(" ",age, " year"),homicides, ignore.case=T))
  return(age.list)  
}

agecount(66)
