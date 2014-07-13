complete <- function(directory, id = 1:332) {
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

filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)
ldf <- lapply(filenames, read.csv)
funkcja_pomocnicza<-function(x) {sum(complete.cases(x))}
lista_zliczen<- lapply(ldf[id],funkcja_pomocnicza)
wektor_zliczen<-unlist(lista_zliczen)
costam<-data.frame(id,nobs=wektor_zliczen)
return(costam)
}