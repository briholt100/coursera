#####below to best.R

best<-function(state,outcome){
  #for home:
  #directoryBase <- "C:/Documents and Settings/brian/My Documents/My Data Sources/MOOC/coursera computing data science/ProgAssign2/"    
  #for campus:
  #
  directoryBase <- "I:\\My Data Sources\\coursera\\Computing for Data analysis\\"    
  setwd(directoryBase)
  hospitals<-read.csv(file=paste0(directoryBase,"hospital-data.csv"),header=T)
  outcomes<-read.csv(file=paste0(directoryBase,"outcome-of-care-measures.csv"),colClasses="character")
  
  outcome.list<- c("heart attack","heart failure","pneumonia")
  state.list<-levels(factor(outcomes$State))
  if (state %in% state.list & outcome %in% outcome.list){
    
    state.df<-data.frame(outcomes[outcomes$State==state,c(7,11,17,23,2)])
    colnames(state.df)<-c("state","heart attack","heart failure","pneumonia","name")
 
    state.df[,2]<-suppressWarnings(as.numeric(state.df[,2]))
    state.df[,3]<-suppressWarnings(as.numeric(state.df[,3]))
    state.df[,4]<-suppressWarnings(as.numeric(state.df[,4]))
    
    state.df<-state.df[order(state.df[,outcome],state.df[,"name"],na.last=T),]
 
    print(state.df[1,5])
#for check    print(head(state.df)) 
  
  
  }
  else {
    if(state %in% state.list==F){
      stop("invalid state")
    }
        else{
          stop("invalid outcome")
        }
  }
}
#best("FL","heart failure")

