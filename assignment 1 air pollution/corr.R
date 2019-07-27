corr <- function(directory,threshold=0)
{
  ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
  
  allcorrs <-vector(mode="numeric",length=0)
 
  for(filename in dir())
 {
    df = read.csv(filename)
    good=complete.cases(df)
    if(sum(good)>threshold)
    {
     df<-df[good,]
     correlation <-cor(df["sulfate"],df["nitrate"])
     allcorrs<-append(allcorrs,correlation)
    }
  
  }
  
  allcorrs
}
