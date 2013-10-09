directoryBase <- "C:/Documents and Settings/brian/My Documents/My Data Sources/MOOC/coursera computing data science/ProgAssign2/"    
setwd(directoryBase)
hospitals<-read.csv(file=paste0(directoryBase,"hospital-data.csv"),header=T)
head(hospitals,19)

outcomes<-read.csv(file=paste0(directoryBase,"outcome-of-care-measures.csv"),colClasses="character")
str(outcomes)


#####below to best.R

best<-function(state,outcome){
  outcome.list<- c("heart attack","heart failure","pneumonia")
  state.list<-levels(factor(outcomes$State))
  if (state %in% state.list & outcome %in% outcome.list){
    
  ##Here I need to really make a dictionary, but maybe a d.f that includes the state's
    #lowest mortality rates, and it's hospitals
    #rank them, and return the best (lowest)
    state.df<-data.frame(outcomes[outcomes$State==state,c(7,11,17,23,2)])
    colnames(state.df)<-c("state","heart attack","heart failure","pneumonia","name")
    #state.df<-data.frame(state.df)
    state.df[,2]<-as.numeric(state.df[,2])
    state.df[,3]<-as.numeric(state.df[,3])
    state.df[,4]<-as.numeric(state.df[,4])
    
    state.df<-state.df[order(state.df[,outcome],na.last=T),]
    
  ###at this point, must deal with ties, which still only 
    #leads to the printing of one hospital, but that one will be alphabetized
    #which basically means I need to ascend by first then 2nd column
    
    #for(st in 1:state)
    print(state.df[1,5])
    print(head(state.df))
  
  
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
best("FL","heart failure")


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
complete(id=289)
#complete(id=1)
#complete(id=c(2,4,8,10,12))
#complete(id=c(30:25))


