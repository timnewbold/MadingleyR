DownloadRelease <- function(codeDir){
  
  if(!dir.exists(codeDir)){
    dir.create(codeDir)
  }
  suppressWarnings(dir.create(paste(codeDir,"/MadingleyBuild",sep="")))
  
  
  download.file(url = "https://dl.dropboxusercontent.com/u/23999497/MadingleyMasterCompiled.zip",
                destfile = paste(codeDir,"/MadingleyBuild/MadingleyMasterCompiled.zip",sep=""))
  
  unzip(zipfile = paste(codeDir,"/MadingleyBuild/MadingleyMasterCompiled.zip",sep=""),
        exdir = paste(codeDir,"/MadingleyBuild",sep=""))
   
}
