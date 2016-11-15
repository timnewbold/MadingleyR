RunMadingley <- function(codeDir,init){
  
  origDir <- getwd()
  
  setwd(paste(codeDir,"/MadingleyBuild",sep=""))
  
  initFileLookup <- list(bottom_lat=1,
                         top_lat=1,
                         left_long=1,
                         right_long=1,
                         label=4,
                         cellsize=1,
                         timestep=1,
                         duration=1,
                         burnin=1,
                         impact=1,
                         recovery=1,
                         parallel_cells=1,
                         parallel_simulations=1,
                         single_realm=1,
                         random=1,
                         extinction_threshold=1,
                         max_cohorts=1,
                         track_processes=2,
                         track_crosscell_processes=2,
                         track_global_processes=2,
                         output_detail=2,
                         output_metrics=2,
                         track_land_use=2,
                         live_outputs=2,
                         specific_locations=1,
                         save_final_state=2,
                         read_state=1)
  
  initDF <- data.frame(Parameter=NA,Value=unlist(init$init))
  initDF$Value <- paste(initDF$Value)
  initDF$Parameter[(row.names(initDF)=="bottom_lat")] <- "Bottom Latitude"
  initDF$Parameter[(row.names(initDF)=="top_lat")] <- "Top Latitude"
  initDF$Parameter[(row.names(initDF)=="left_long")] <- "Leftmost Longitude"
  initDF$Parameter[(row.names(initDF)=="right_long")] <- "Rightmost Longitude"
  initDF$Parameter[(row.names(initDF)=="label")] <- "Label"
  initDF$Parameter[(row.names(initDF)=="cellsize")] <- "Grid Cell Size"
  initDF$Parameter[(row.names(initDF)=="timestep")] <- "Timestep Units"
  initDF$Parameter[(row.names(initDF)=="duration")] <- "Length of simulation (years)"
  initDF$Parameter[(row.names(initDF)=="burnin")] <- "Burn-in (years)"
  initDF$Parameter[(row.names(initDF)=="impact")] <- "Impact duration (years)"
  initDF$Parameter[(row.names(initDF)=="recovery")] <- "Recovery duration (years)"
  initDF$Parameter[(row.names(initDF)=="parallel_cells")] <- "Run Cells In Parallel"
  initDF$Parameter[(row.names(initDF)=="parallel_simulations")] <- "Run Simulations In Parallel"
  initDF$Parameter[(row.names(initDF)=="single_realm")] <- "Run Single Realm"
  initDF$Parameter[(row.names(initDF)=="random")] <- "Draw Randomly"
  initDF$Parameter[(row.names(initDF)=="extinction_threshold")] <- "Extinction Threshold"
  initDF$Parameter[(row.names(initDF)=="max_cohorts")] <- "Maximum Number Of Cohorts"
  initDF$Parameter[(row.names(initDF)=="track_processes")] <- "Track Processes"
  initDF$Parameter[(row.names(initDF)=="track_crosscell_processes")] <- "Track Cross Cell Processes"
  initDF$Parameter[(row.names(initDF)=="track_global_processes")] <- "Track Global Processes"
  initDF$Parameter[(row.names(initDF)=="output_detail")] <- "Output Detail"
  initDF$Parameter[(row.names(initDF)=="output_metrics")] <- "Output metrics"
  initDF$Parameter[(row.names(initDF)=="track_land_use")] <- "Track land use specifics"
  initDF$Parameter[(row.names(initDF)=="live_outputs")] <- "Live outputs"
  initDF$Parameter[(row.names(initDF)=="specific_locations")] <- "Specific Location File"
  initDF$Parameter[(row.names(initDF)=="save_final_state")] <- "Output Model State Timesteps"
  initDF$Parameter[(row.names(initDF)=="read_state")] <- "Read State"
  
  initFileSplit <- unlist(initFileLookup[match(row.names(initDF),names(initFileLookup))])
  
  initDFs <- split(initDF,initFileSplit)
  
  if (initDFs$`1`['read_state',]$Value){
    initDFs$`1`['read_state',]$Value <- "ReadModelState.csv"
  } else {
    initDFs$`1`['read_state',]$Value <- ""
  }
  
  if (initDFs$`1`['specific_locations',]$Value){
    initDFs$`1`['specific_locations',]$Value <- "SpecificLocations.csv"
  } else {
    initDFs$`1`['specific_locations',]$Value <- ""
  }
  
  initDFs$`1` <- rbind(initDFs$`1`,data.frame(Parameter=c("Plankton size threshold",
                                                          "Impact Cell Index",
                                                          "Dispersal only",
                                                          "Dispersal only type"),
                                              Value=c(0.01,
                                                      "all",
                                                      "no",
                                                      "advection")))
  
  if (initDFs$`2`['save_final_state',]$Value){
    initDFs$`2`['save_final_state',]$Value <- (initDFs$`1`['duration',]$Value*12)-1
  } else {
    initDFs$`2`['save_final_state',]$Value <- 999999999
  }
  
  initDFs$`2` <- rbind(initDFs$`2`,data.frame(Parameter=c("Track marine specifics",
                                                          "New Cohorts Filename",
                                                          "Maturity Filename",
                                                          "Predation Flows Filename",
                                                          "Herbivory Flows Filename",
                                                          "Biomasses Eaten Filename",
                                                          "Trophic Flows Filename",
                                                          "Mortality Filename",
                                                          "Extinction Filename",
                                                          "Growth Filename",
                                                          "Metabolism Filename",
                                                          "NPP Filename"),
                                              Value=c("no",
                                                      "NewCohorts",
                                                      "Maturity",
                                                      "PredationFlows",
                                                      "HerbivoryFlows",
                                                      "BiomassesEaten",
                                                      "TrophicFlows",
                                                      "Mortality",
                                                      "Extinction",
                                                      "Growth",
                                                      "Metabolism",
                                                      "NPP")))
  
  initDFs$'3' <- data.frame(Parameter=c("Mass Bin Filename",
                                        "Environmental Data File",
                                        "Cohort Functional Group Definitions File",
                                        "Stock Functional Group Definitions File",
                                        "Ecological parameters file"),
                            Value=c("MassBinDefinitions.csv",
                                    "EnvironmentalDataLayers.csv",
                                    "CohortFunctionalGroupDefinitions.csv",
                                    "StockFunctionalGroupDefinitions.csv",
                                    "EcologicalParameters.csv"))
  
  write.csv(x = initDFs$`1`,file = "input/Model setup/SimulationControlParameters.csv",
            quote = FALSE,row.names = FALSE)
  write.csv(x = initDFs$`2`,file = "input/Model setup/OutputControlParameters.csv",
            quote = FALSE,row.names = FALSE)
  write.csv(x = initDFs$`3`,file = "input/Model setup/FileLocationParameters.csv",
            quote = FALSE,row.names = FALSE)
  write.table(x = initDFs$`4`$Value,
              file = "input/Model setup/Initial Model State Setup/OutputsLabel.csv",
              sep=",",quote = FALSE,row.names = FALSE,col.names = FALSE)
  
  write.csv(x = init$locations,
            file = "input/Model setup/Initial model state setup/SpecificLocations.csv",
            quote = FALSE,row.names = FALSE)
  
  dir1 <- dir()
  
  shell("Madingley.exe")
  
  dir2 <- dir()
  
  outputDir <- setdiff(dir2,dir1)
  
  setwd(origDir) 
  
  return(list(outputDir=paste(codeDir,"/MadingleyBuild/",outputDir,sep="")))
  
}