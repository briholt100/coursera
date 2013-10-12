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
  if (!outcome %in% outcome.list){stop("invalid outcome")  }
      
  for(state in state.list) {
    worst.index<-c()
    worst.df<-data.frame()
    state.df<-data.frame(outcomes[outcomes$State==state,c(7,11,17,23,2)]) #this adds 
                #state, heart attack, ht failure, pneu, name to dataframe
    state.df<-cbind(state.df,as.integer(1)) #this adds a 6th column for rank
    colnames(state.df)<-c("state","heart attack","heart failure","pneumonia","name","Rank") 
    state.df<-state.df[order(state.df[,outcome],state.df[,"name"],na.last=T),]
    state.df[,6]<-1:nrow(state.df) #this adds the actual ranking    
    
    if(num=="best"){num<-1}
    
    if (is.integer(num)|is.numeric(num)){
        out.df<-rbind(out.df,state.df[num,c(5,1)])
    }

    if(num=="worst"){ 
       worst.index<-which(state.df[,outcome]>=max(state.df[,outcome],na.rm=T))
       out.df<-rbind(out.df,state.df[worst.index,c(5,1)])

    }  
    }
  colnames(out.df)<-c("hospital","state")
  print(out.df)
}
#rankall("pneumonia","worst")