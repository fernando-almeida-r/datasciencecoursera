complete <- function(directory, id=1:332)
        
#Search for matches to argument in directory  
{if(grep("specdata", directory)==1)
{directory <- ("D:/Projetos/R/Coursera/datascience/R_Programming/Week_2/specdata/")}       
        
#List files from specdata and its names as character
specdatafiles <- as.character((list.files(directory)))
        
#Add path to files names
specdatapaths <- paste(directory, specdatafiles, sep = "")
        
#Add support variables
nlinha <- matrix(ncol = 2)
linha <- matrix(ncol = 2)
        
for(i in id){
                #Add data from i-th file                
                curr_file <- read.csv(specdatapaths[i], header = TRUE, sep = ',',skip = 1)
                head(curr_file)
                
                #Filter out NAs
                no_na <- curr_file[complete.cases(curr_file),]
                
                #Add rows with id of file and number of no NAs
                linha <- cbind(id = i,nobs = nrow(no_na))
                nlinha <- rbind(nlinha,linha)
        }

return(nlinha[-c(1),])
}

complete("./specdata")