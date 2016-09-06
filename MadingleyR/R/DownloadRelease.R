DownloadRelease <- function(codeDir){
  
  if(!dir.exists(codeDir)){
    dir.create(codeDir)
  }
  dir.create(paste(codeDir,"/Madingley",sep=""))
  
  
  download.file(url = "https://dl.dropboxusercontent.com/u/23999497/MadingleyMasterCompiled.zip",
                destfile = paste(codeDir,"/Madingley/MadingleyMasterCompiled.zip",sep=""))
  
  
}
