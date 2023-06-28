corr <- function(directory, threshold = 0)
        
        #Search for matches to argument in directory  
{if(grep("specdata", directory)==1)
{directory <- ("D:/Projetos/R/Coursera/datascience/R_Programming/Week_2/specdata/")}       
        
#List files from specdata and its names as character
specdatafiles <- as.character((list.files(directory, pattern = "*.csv")))
        
#Add path to files names
specdatapaths <- paste(directory, specdatafiles, sep = "")
        
#Support variables
alfiles <- data.frame()
correlations <- c()
archives <- length(specdatafiles)
        
for(i in 1:archives){
        #Add data from i-th file
        curr_file <- read.csv(specdatapaths[i], header = FALSE, sep = ',',skip = 1)
        head(curr_file)
                
        #Filter out NAs
        no_na <- curr_file[complete.cases(curr_file),]
                
        #Insert column names
        colnames(no_na) <- c("Date", "sulfate", "nitrate", "ID")
                
        #Create vector of correlations values between Sulfate and Nitrate
        if (nrow(no_na) >= threshold) 
                {correlations <- c(correlations,cor(no_na$sulfate,no_na$nitrate))}
        }    

return(correlations)
}

corr("./specdata", 150)