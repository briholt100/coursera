#for home:
#
directoryBase <- "C:/Documents and Settings/brian/My Documents/My Data Sources/MOOC/coursera computing data science/ProgAssign2/"    
#for campus:
#directoryBase <- "I:\\My Data Sources\\coursera\\Computing for Data analysis\\"    
setwd(directoryBase)
hospitals<-read.csv(file=paste0(directoryBase,"hospital-data.csv"),header=T)
outcomes<-read.csv(file=paste0(directoryBase,"outcome-of-care-measures.csv"),colClasses="character")
outcomes[,11]<-suppressWarnings(as.numeric(outcomes[,11]))
outcomes[,17]<-suppressWarnings(as.numeric(outcomes[,17]))
outcomes[,23]<-suppressWarnings(as.numeric(outcomes[,23]))

rankall<-function(outcome,num){
  
  outcome.list<- c("heart attack","heart failure","pneumonia")
  state.list<-levels(factor(outcomes$State))
  out.df<-data.frame()
  
  
  #validate
    
  if (outcome %in% outcome.list){  }
  else {
    if(outcome %in% outcome.list==F){
      stop("invalid outcome")
      } 
    }
  
  if (is.integer(num)|is.numeric(num)){print("yay")
    #if(num > nrow(state.df)){return(NA)}
    #else{
     # return(as.character(state.df[num,5]))
    #}
    #for check    print(head(state.df,num+5))
  }
  
  for(state in state.list) {print(state)}
    
  state.df<-data.frame(outcomes[outcomes$State==state,c(7,11,17,23,2)]) #this adds state, attack, failure, pneu, name to dataframe
  state.df<-cbind(state.df,as.integer(1))
  colnames(state.df)<-c("state","heart attack","heart failure","pneumonia","name","Rank")  
}
#
rankall("heart attack",5)












#state.df<-state.df[order(state.df[,outcome],state.df[,"name"],na.last=T),]
#state.df[,6]<-1:nrow(state.df)



#if(num=="best"){
#  num<-1
#  return(as.character(state.df[num,5]))
#}

#if(num=="worst"){ 
 # worst.index<-which(state.df[,outcome]>=max(state.df[,outcome],na.rm=T))
  #state.df<-state.df[worst.index,]
  #return(as.character(state.df[num,5]))
#} 

#}
