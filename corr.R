corr <- function(directory,threshold=0)
{
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