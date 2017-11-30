DownloadRelease <- function(codeDir){
  
  if(!dir.exists(codeDir)){
    dir.create(codeDir)
  }
  suppressWarnings(dir.create(paste(codeDir,"/MadingleyBuild",sep="")))
  
  
  download.file(url = "https://www.dropbox.com/s/lyc9vcjfsrhrryv/MadingleyMasterCompiled.zip?dl=0",
                destfile = paste(codeDir,"/MadingleyBuild/MadingleyMasterCompiled.zip",sep=""),
                method="wget")
  
  unzip(zipfile = paste(codeDir,"/MadingleyBuild/MadingleyMasterCompiled.zip",sep=""),
        exdir = paste(codeDir,"/MadingleyBuild",sep=""))
   
}
