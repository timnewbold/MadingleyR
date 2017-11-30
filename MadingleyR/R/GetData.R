GetMadingleyData <- function(codeDir,zipFile=NULL){
  
  if(!dir.exists(paste(codeDir,"/MadingleyBuild",sep=""))){
    .Log("Error: Build directory not found. Use DownloadRelease function first")
    stop()
  }
 
  if(is.null(zipFile)){
    download.file(url = "https://www.dropbox.com/s/eiowm9hsn4wn511/MadingleyData.zip?dl=0",
                  destfile = paste(codeDir,"/MadingleyBuild/input/MadingleyData.zip",sep=""),
                  method="wget")
    
    unzip(zipfile = paste(codeDir,"/MadingleyBuild/input/MadingleyData.zip",sep=""),
          exdir = paste(codeDir,"/MadingleyBuild/input",sep=""))
  } else {
    unzip(zipfile = zipFile,
          exdir = paste(codeDir,"/MadingleyBuild/input",sep=""))
  }
  
  
   
}