corr <- function(directory, threshold = 0)
        
        #Search for matches to argument in directory  
{if(grep("specdata", directory)==1)
{directory <- ("D:/Projetos/Coursera/R_Programming/Week_2/specdata/")}       
        
        #List files from specdata and its names as character
        specdatafiles <- as.character((list.files(directory, pattern = "*.csv")))
        #Add path to files names
        specdatapaths <- paste(directory, specdatafiles, sep = "")
        
        alfiles <- data.frame()
        correlations <- c()
        archives <- length(specdatafiles)
        
        for(i in 1:archives){
                curr_file <- read.csv(specdatapaths[i], header = FALSE, sep = ',',skip = 1)
                head(curr_file)
                no_na <- curr_file[complete.cases(curr_file),]
                colnames(no_na) <- c("Date", "sulfate", "nitrate", "ID")
                if (nrow(no_na) >= threshold) {correlations <- c(correlations,cor(no_na$sulfate,no_na$nitrate))}
                
        }    
        #colnames(alfiles) <- c("Date", "sulfate", "nitrate", "ID")
        
        #nona_allfiles <- allfiles[complete.cases(allfiles),]
        #correlation <- cor(alfiles$sulfate, alfiles$nitrate, use = "complete.obs")
        
        return(correlations)
}

corr("./specdata", 150)