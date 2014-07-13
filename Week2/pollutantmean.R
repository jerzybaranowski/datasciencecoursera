pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        x<-numeric()
        for (i in seq_along(id)){
                nazwa_pliku<-as.character(id[i])
                if(nchar(nazwa_pliku)==1){
                        sciezka<-paste(directory,"/00",nazwa_pliku,".csv",sep="")
                }
                else if(nchar(nazwa_pliku)==2){
                        sciezka<-paste(directory,"/0",nazwa_pliku,".csv",sep="")
                }
                else{
                        sciezka<-paste(directory,"/",nazwa_pliku,".csv",sep="")
                }
                pom<-read.csv(sciezka)[,pollutant]
                x<-c(x,pom)
        } 
        srednia<-mean(x,na.rm=T)
        return(srednia)
}