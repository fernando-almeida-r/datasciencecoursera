complete <- function(directory, id=1:332)
        
        #Search for matches to argument in directory  
{if(grep("specdata", directory)==1)
{directory <- ("D:/Projetos/Coursera/R_Programming/Week_2/specdata/")}       
        
        #List files from specdata and its names as character
        specdatafiles <- as.character((list.files(directory)))
        #Add path to files names
        specdatapaths <- paste(directory, specdatafiles, sep = "")
        nlinha <- matrix(ncol = 2)
        linha <- matrix(ncol = 2)
        
        for(i in id){
                curr_file <- read.csv(specdatapaths[i], header = TRUE, sep = ',',skip = 1)
                head(curr_file)
                no_na <- curr_file[complete.cases(curr_file),]
                linha <- cbind(id = i,nobs = nrow(no_na))
                nlinha <- rbind(nlinha,linha)
        }
        #remove_na <- curr_file[!is.na(curr_file[,pollutant]),pollutant]  
        
        return(nlinha[-c(1),])
}

complete("./specdata")