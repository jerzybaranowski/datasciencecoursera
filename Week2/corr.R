corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        lk<-complete(directory)
        lista_tr<-lk[lk[,"nobs"]>threshold,]
        id<-lista_tr[,"id"]
        korelacje<-numeric()
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
                pom<-read.csv(sciezka)
                korelacje[i]<-cor(pom[,'nitrate'],pom[,'sulfate'],use="pairwise.complete.obs")
        } 
        return(korelacje)
}