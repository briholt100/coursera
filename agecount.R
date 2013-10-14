#for home:
#directoryBase <- "C:/Documents and Settings/brian/My Documents/My Data Sources/MOOC/coursera computing data science/ProgAssign2/"    
#for campus:
#

"2 Ages of homicide victims
The goal of this part is to write a function called agecount
that returns the number of homicide victims of a given age. For most (but not all) records there is an indication of the
age of the victim. Your function should take one argument, the age of the victim(s), extract
the age of the victim from each record and then return a count of the number of victims of
the specied age.
The argument passed to agecount should be a positive integer, but you do not need
to check for this.

If a record does not contain any age information, the record should be ignored.
The function should return an integer indicating the number of victims of a given age.
Your function should read the homicides dataset in the manner indicated above.
The function should use the following template

agecount <- function(age = NULL) {
## Check that "age" is non-NULL; else throw error
## Read "homicides.txt" data file
## Extract ages of victims; ignore records where no age is
## given
## Return integer containing count of homicides for that age
  }

The function should execute as follows:
> agecount(3)
[1] 0
> num <- agecount(21)
> print(num)
[1] 60
Save your code for this function to a le named
agecount.R"

agecount
age.list<-c()
if !cause %in% cause.list{stop function}
else{
  parse age of vic
  store age of vic
  for (in in list){ age.list<-cbind(age.list,age of vic)}###instead of cbind, append?
  
}




directoryBase <- "I:\\My Data Sources\\coursera\\Computing for Data analysis\\"    
setwd(directoryBase)
agecount<-function(cause){
  homicides <- readLines("homicides.txt")
  causes.list<-c("asphyxiation" ,"blunt force","other","shooting","stabbing","unknown")
  if (!cause %in% causes.list){stop("invalid cause")  }
  count<-length(grep(paste0("cause: ",cause),homicides, ignore.case=T))
  return(count)
  
}
