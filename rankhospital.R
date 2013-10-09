#####below to best.R

rankhospital<-function(state,outcome,num=1){
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
    state.df<-cbind(state.df,as.integer(1))
    colnames(state.df)<-c("state","heart attack","heart failure","pneumonia","name","Rank")
    
    state.df[,2]<-suppressWarnings(as.numeric(state.df[,2]))
    state.df[,3]<-suppressWarnings(as.numeric(state.df[,3]))
    state.df[,4]<-suppressWarnings(as.numeric(state.df[,4]))
    state.df<-state.df[order(state.df[,outcome],state.df[,"name"],na.last=T),]
    state.df[,6]<-1:nrow(state.df)
  
        
    
    if (is.integer(num)|is.numeric(num)){
      if(num > nrow(state.df)){print(NA)}
      else{
      print(state.df[num,5])
      }
      #for check    print(head(state.df,num+5))
    }
    
    
    if(num=="best"){
      num<-1
      print(state.df[num,5])
    }
    
    if(num=="worst"){ 
      worst.index<-which(state.df[,outcome]>=max(state.df[,outcome],na.rm=T))
      state.df<-state.df[worst.index,]
      print(state.df[,5])
    } 
    
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
#rankhospital("MN","heart attack",5000)
