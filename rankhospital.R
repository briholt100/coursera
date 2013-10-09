#####below to best.R

rankhospital<-function(state,outcome,num){
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
    
    ##Here I need to really make a dictionary, but maybe a d.f that includes the state's
    #lowest mortality rates, and it's hospitals
    #rank them, and return the best (lowest)
    state.df<-data.frame(outcomes[outcomes$State==state,c(7,11,17,23,2)])
    colnames(state.df)<-c("state","heart attack","heart failure","pneumonia","name")
    #state.df<-data.frame(state.df)
    state.df[,2]<-suppressWarnings(as.numeric(state.df[,2]))
    state.df[,3]<-suppressWarnings(as.numeric(state.df[,3]))
    state.df[,4]<-suppressWarnings(as.numeric(state.df[,4]))
    
    state.df<-state.df[order(state.df[,outcome],state.df[,"name"],na.last=T),]
    
    ###at this point, must deal with ties, which still only 
    #leads to the printing of one hospital, but that one will be alphabetized
    #which basically means I need to ascend by first then 2nd column
    
    #for(st in 1:state)
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
#rankhospital("MD","heart failure",5)
