pollutantmean <- function(directory, pollutant = "nitrate", id=1:332)
        
#Search for matches to argument in directory   
{if(grep("specdata", directory)==1)
{directory <- ("D:/Projetos/R/Coursera/datascience/R_Programming/Week_2/specdata/")}       
        
#Add support variable
mean_polldata <- c()        
        
#List files from specdata and its names as character
specdatafiles <- as.character((list.files(directory)))

#Add path to files names
specdatapaths <- paste(directory, specdatafiles, sep = "")
        
for(i in id){
        #Add data from i-th file
        curr_file <- read.csv(specdatapaths[i], header = TRUE, sep = ',')
        head(curr_file)
        pollutant

        #Filter out NAs        
        remove_na <- curr_file[!is.na(curr_file[,pollutant]),pollutant]
                
        #Add a sequence of all no NA data
        mean_polldata <- c(mean_polldata, remove_na)
        }
        
mean_resuts <- mean(mean_polldata)
return(round(mean_resuts,3))
}

pollutantmean("./specdata","nitrate", 45)