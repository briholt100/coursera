
corr <- function(directory="specdata", threshold = 0) {
  cor.vec<-as.numeric(as.vector(c()))

  directoryBase <- "C:/Documents and Settings/brian/My Documents/My Data Sources/MOOC/coursera computing data science/ProgAssign2/"    
  
  workingDir <- paste0(directoryBase,directory)    
  file.count<-length(list.files(workingDir))
  
  for (i in 1:file.count){
    id<-i
        while(nchar(id)<=2){
          id<-paste0("0",id)
        }
    fileID <-paste0 (id,".csv")
    fileLoc <- paste(workingDir,fileID,sep = "/")
    output<-read.csv(file=fileLoc,header=T)
    good<-complete.cases(output)
    row.count<-nrow(output[good,])
    df<-data.frame(output[good,])
    if (row.count >= threshold) {cor.vec<-append(cor.vec,cor(x=df[,2],y=df[,3]))}
    
    }
  return(cor.vec)
}
   
cr<-corr("specdata")  
head(cr)
summary(cr)
length(cr)
#cr<-corr("specdata")  