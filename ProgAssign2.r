
getmonitor <- function(id, directory="specdata", summarize = FALSE) {
  ## 'id' is a vector of length 1 indicating the monitor ID
  ## number. The user can specify 'id' as either an integer, a
  ## character, or a numeric.
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'summarize' is a logical indicating whether a summary of
  ## the data should be printed to the console; the default is
  ## FALSE
  while(nchar(id)<3){
    id<-paste0("0",id)
  }
  fileID <-paste0 (id,".csv")
  directoryBase <- "C:/Documents and Settings/brian/My Documents/My Data Sources/MOOC/coursera computing data science/ProgAssign2/"
  workingDir <- paste0(directoryBase,directory)
  fileLoc <- paste(workingDir,fileID,sep = "/")
  fileLoc
  if (summarize == TRUE) {print(summary(read.csv(file=fileLoc,header=T)))}
  return(read.csv(file=fileLoc,header=T))
  
}

data<-getmonitor(id=200, summarize=TRUE)
head(data)