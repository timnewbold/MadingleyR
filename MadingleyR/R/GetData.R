GetMadingleyData <- function(codeDir,zipFile=NULL){
  
  if(!dir.exists(paste(codeDir,"/MadingleyBuild",sep=""))){
    .Log("Error: Build directory not found. Use DownloadRelease function first")
    stop()
  }
 
  if(is.null(zipFile)){
    download.file(url = "https://dl.dropboxusercontent.com/u/23999497/MadingleyData.zip",
                  destfile = paste(codeDir,"/MadingleyBuild/input/MadingleyData.zip",sep=""))
    
    unzip(zipfile = paste(codeDir,"/MadingleyBuild/input/MadingleyData.zip",sep=""),
          exdir = paste(codeDir,"/MadingleyBuild/input",sep=""))
  } else {
    unzip(zipfile = zipFile,
          exdir = paste(codeDir,"/MadingleyBuild/input",sep=""))
  }
  
  
   
}