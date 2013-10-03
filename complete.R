get.row<-function(directory="specdata", id ){    
  while(nchar(id)<=2){
  id<-paste0("0",id)
  }
  fileID <-paste0 (id,".csv")
  directoryBase <- "C:/Documents and Settings/brian/My Documents/My Data Sources/MOOC/coursera computing data science/ProgAssign2/"    
  workingDir <- paste0(directoryBase,directory)    
  fileLoc <- paste(workingDir,fileID,sep = "/")
  output<-read.csv(file=fileLoc,header=T)
  good<-complete.cases(output)
  row<-cbind(as.numeric(id),as.numeric(nrow(output[good,])))
  return(row)
}


complete <- function(directory="specdata", id ) {
  df<-matrix(nrow=length(id),ncol=2)  
  for (i in 1:length(id)){
    df[i,]<-cbind(get.row(directory,id[i]))
  }
  df<-data.frame(df)
  colnames(df)<-c("id","nobs")
  return(df)
}
complete(id=3)
#complete(id=1)
#complete(id=c(2,4,8,10,12))
#complete(id=c(30:25))


