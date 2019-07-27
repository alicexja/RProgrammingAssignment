pollutantmean <- function(directory,pollutant,id=1:332)
{
 ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
  
  #set working directory
  setwd(oldwd)
  setwd(directory)
  
  #the mean equals sum/total_num.first define the accumulator
  accumulator <- 0
  total_num <- 0
  
 for(ind in id)
 {
   #first make ind 3 digits
   filename <- sprintf("%03d.csv",ind)
   df <-read.csv(filename)
   good <- complete.cases(df[[pollutant]])
   df <-df[good,]
   
   accumulator<- accumulator + sum(df[[pollutant]],na.rm = TRUE)
   total_num <- total_num + nrow(df)
   #cat(ind)
 }
  
  accumulator/total_num
}
