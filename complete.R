complete <-function(directory,id=1:332)
{
 # setwd(oldwd)
  #setwd(directory)
  
  nobs <- vector(mode="integer",length=length(id))
  
  for(ind in id)
  {
    filename<-sprintf("%03d.csv",ind)
    df <-read.csv(filename)
    good<-complete.cases(df)
    nobs <- append(nobs,sum(good))
  }
  
  data.frame(id,nobs)
}