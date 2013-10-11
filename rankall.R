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
    
  if (!outcome %in% outcome.list){stop("invalid outcome")  }
    
  #pull ranked outcomes and put into data.frame
      
  for(state in state.list) {
    state.df<-data.frame(outcomes[outcomes$State==state,c(7,11,17,23,2)]) #this adds 
                #state, heart attack, ht failure, pneu, name to dataframe
    state.df<-cbind(state.df,as.integer(1)) #this adds a 6th column for rank
    colnames(state.df)<-c("state","heart attack","heart failure","pneumonia","name","Rank") 
    state.df<-state.df[order(state.df[,outcome],state.df[,"name"],na.last=T),]
    state.df[,6]<-1:nrow(state.df) #this adds the actual ranking
    
    
    worst.index<-c()
    worst.df<-data.frame()
    
    if (is.integer(num)|is.numeric(num)){
      if(num > nrow(state.df)){return(NA)}
      else{
        return(as.character(state.df[num,]))
      }
      #for check    print(head(state.df,num+5))
    }
    if(num=="best"){
      num<-1
    }
    if (is.integer(num)|is.numeric(num)){
      if(num > nrow(state.df)){return(NA)}
      else{
        return(as.character(state.df[num,]))
      }
      #for check    print(head(state.df,num+5))
    }
    
    if(num=="worst"){ 
       worst.index<-which(state.df[,outcome]>=max(state.df[,outcome],na.rm=T))
         }
    #state.df<-state.df[worst.index,]
   # worst.index<-worst.index
    print(state)
    print(worst.index)
    #print(state.df[worst.index,])  I want to return worst.index and use THAT to create the final table
    
    }
  }
    
  
#}
#
rankall("heart attack","worst")