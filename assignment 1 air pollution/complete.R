complete <-function(directory,id=1:332)
{
 ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
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
