RunMadingley <- function(codeDir){
  
  origDir <- getwd()
  
  setwd(paste(codeDir,"/MadingleyBuild",sep=""))
  
  shell("Madingley.exe")
 
  setwd(origDir) 
  
}