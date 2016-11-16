RunMadingley <- function(codeDir,init,params,numSims=1,scenarios=NULL){
  
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
  
  paramsDF <- data.frame(Name=NA,Value=unlist(params),Comments="")
  paramsDF$Name[(row.names(paramsDF)=="reprod_timeunit")] <- "Reproduction.Basic.TimeUnitImplementation"
  paramsDF$Name[(row.names(paramsDF)=="reprod_semelparityallocation")] <- "Reproduction.Basic.SemelparityAdultMassAllocation"
  paramsDF$Name[(row.names(paramsDF)=="reprod_massthreshold")] <- "Reproduction.Basic.MassRatioThreshold"
  paramsDF$Name[(row.names(paramsDF)=="reprod_massevolutionthreshold")] <- "Reproduction.Basic.MassEvolutionProbabilityThreshold"
  paramsDF$Name[(row.names(paramsDF)=="reprod_massevolutionsd")] <- "Reproduction.Basic.MassEvolutionStandardDeviation"
  paramsDF$Name[(row.names(paramsDF)=="metab_endo_timeunit")] <- "Metabolism.Endotherm.TimeUnitImplementation"
  paramsDF$Name[(row.names(paramsDF)=="metab_endo_massexponent")] <- "Metabolism.Endotherm.MetabolismMassExponent"
  paramsDF$Name[(row.names(paramsDF)=="metab_endo_normalization")] <- "Metabolism.Endotherm.NormalizationConstant"
  paramsDF$Name[(row.names(paramsDF)=="metab_endo_activationenergy")] <- "Metabolism.Endotherm.ActivationEnergy"
  paramsDF$Name[(row.names(paramsDF)=="boltzmann")] <- "BoltzmannConstant"
  paramsDF$Name[(row.names(paramsDF)=="metab_energyscalar")] <- "Metabolism.EnergyScalar"
  paramsDF$Name[(row.names(paramsDF)=="metab_ecto_timeunit")] <- "Metabolism.Ectotherm.TimeUnitImplementation"
  paramsDF$Name[(row.names(paramsDF)=="metab_ecto_massexponent")] <- "Metabolism.Ectotherm.MetabolismMassExponent"
  paramsDF$Name[(row.names(paramsDF)=="metab_ecto_normalization")] <- "Metabolism.Ectotherm.NormalizationConstant"
  paramsDF$Name[(row.names(paramsDF)=="metab_ecto_activationenergy")] <- "Metabolism.Ectotherm.ActivationEnergy"
  paramsDF$Name[(row.names(paramsDF)=="metab_ecto_basalmassexponent")] <- "Metabolism.Ectotherm.BasalMetabolismMassExponent"
  paramsDF$Name[(row.names(paramsDF)=="metab_ecto_basalnormalization")] <- "Metabolism.Ectotherm.NormalizationConstantBMR"
  paramsDF$Name[(row.names(paramsDF)=="activity_terr_wtintercept")] <- "Activity.Terrestrial.WarmingToleranceIntercept"
  paramsDF$Name[(row.names(paramsDF)=="activity_terr_wtslope")] <- "Activity.Terrestrial.WarmingToleranceSlope"
  paramsDF$Name[(row.names(paramsDF)=="activity_terr_tsmintercept")] <- "Activity.Terrestrial.TSMIntercept"
  paramsDF$Name[(row.names(paramsDF)=="activity_terr_tsmslope")] <- "Activity.Terrestrial.TSMSlope"
  paramsDF$Name[(row.names(paramsDF)=="mort_bg_timeunit")] <- "Mortality.Background.TimeUnitImplementation"
  paramsDF$Name[(row.names(paramsDF)=="mort_bg_mortrate")] <- "Mortality.Background.MortalityRate"
  paramsDF$Name[(row.names(paramsDF)=="mort_bg_massslope")] <- "Mortality.Background.MassSlope"
  paramsDF$Name[(row.names(paramsDF)=="mort_bg_lufactor")] <- "Mortality.Background.NonPreferredLanduseMortalityFactor"
  paramsDF$Name[(row.names(paramsDF)=="mort_sen_timeunit")] <- "Mortality.Senescence.TimeUnitImplementation"
  paramsDF$Name[(row.names(paramsDF)=="mort_sen_mortrate")] <- "Mortality.Senescence.MortalityRate"
  paramsDF$Name[(row.names(paramsDF)=="mort_sen_massslope")] <- "Mortality.Senescence.MassSlope"
  paramsDF$Name[(row.names(paramsDF)=="mort_starv_timeunit")] <- "Mortality.Starvation.TimeUnitImplementation"
  paramsDF$Name[(row.names(paramsDF)=="mort_starv_inflection")] <- "Mortality.Starvation.LogisticInflectionPoint"
  paramsDF$Name[(row.names(paramsDF)=="mort_starv_scaling")] <- "Mortality.Starvation.LogisticScalingParameter"
  paramsDF$Name[(row.names(paramsDF)=="mort_starv_maxrate")] <- "Mortality.Starvation.MaximumStarvationRate"
  paramsDF$Name[(row.names(paramsDF)=="herb_timeunit")] <- "Herbivory.RevisedHerbivory.TimeUnitImplementation"
  paramsDF$Name[(row.names(paramsDF)=="herb_marine_handlingscalar")] <- "Herbivory.RevisedHerbivory.Marine.HandlingTimeScalar"
  paramsDF$Name[(row.names(paramsDF)=="herb_terr_handlingscalar")] <- "Herbivory.RevisedHerbivory.Terrestrial.HandlingTimeScalar"
  paramsDF$Name[(row.names(paramsDF)=="herb_marine_handlingexponent")] <- "Herbivory.RevisedHerbivory.Marine.HandlingTimeExponent"
  paramsDF$Name[(row.names(paramsDF)=="herb_terr_handlingexponent")] <- "Herbivory.RevisedHerbivory.Terrestrial.HandlingTimeExponent"
  paramsDF$Name[(row.names(paramsDF)=="herb_handlingrefmass")] <- "Herbivory.RevisedHerbivory.HandlingTimeReferenceMass"
  paramsDF$Name[(row.names(paramsDF)=="herb_ratemassexponent")] <- "Herbivory.RevisedHerbivory.RateMassExponent"
  paramsDF$Name[(row.names(paramsDF)=="herb_rateconstant")] <- "Herbivory.RevisedHerbivory.RateConstant"
  paramsDF$Name[(row.names(paramsDF)=="herb_terr_attackexponent")] <- "Herbivory.RevisedHerbivory.Terrestrial.AttackRateExponent"
  paramsDF$Name[(row.names(paramsDF)=="herb_marine_attackexponent")] <- "Herbivory.RevisedHerbivory.Marine.AttackRateExponent"
  paramsDF$Name[(row.names(paramsDF)=="herb_lu_attack")] <- "Herbivory.RevisedHerbivory.NonPreferredLanduseAttackRateProportion"
  paramsDF$Name[(row.names(paramsDF)=="herb_activation_attackrate")] <- "Herbivory.RevisedHerbivory.ActivationEnergyHandlingTime"
  paramsDF$Name[(row.names(paramsDF)=="herb_activation_handling")] <- "Herbivory.RevisedHerbivory.ActivationEnergyHerbivoryRate"
  paramsDF$Name[(row.names(paramsDF)=="pred_timeunit")] <- "Predation.RevisedPredation.TimeUnitImplementation"
  paramsDF$Name[(row.names(paramsDF)=="pred_terr_handlingscalar")] <- "Predation.RevisedPredation.Terrestrial.HandlingTimeScalar"
  paramsDF$Name[(row.names(paramsDF)=="pred_marine_handlingscalar")] <- "Predation.RevisedPredation.Marine.HandlingTimeScalar"
  paramsDF$Name[(row.names(paramsDF)=="pred_terr_handlingexponent")] <- "Predation.RevisedPredation.Terrestrial.HandlingTimeExponent"
  paramsDF$Name[(row.names(paramsDF)=="pred_terr_handlingpreyexp")] <- "Predation.RevisedPredation.Terrestrial.HandlingTimePreyExponentTerrestrial"
  paramsDF$Name[(row.names(paramsDF)=="pred_marine_handlingexponent")] <- "Predation.RevisedPredation.Marine.HandlingTimeExponent"
  paramsDF$Name[(row.names(paramsDF)=="activationhandlingtime")] <- "Predation.RevisedPredation.Terrestrial.ActivationEnergyHandlingTime"
  paramsDF$Name[(row.names(paramsDF)=="pred_handlingrefmass")] <- "Predation.RevisedPredation.HandlingTimeReferenceMass"
  paramsDF$Name[(row.names(paramsDF)=="pred_killrateconstant")] <- "Predation.RevisedPredation.KillRateConstant"
  paramsDF$Name[(row.names(paramsDF)=="pred_killconstantmassexponent")] <- "Predation.RevisedPredation.KillRateConstantMassExponent"
  paramsDF$Name[(row.names(paramsDF)=="activationattackrate")] <- "Predation.RevisedPredation.ActivationEnergyAttackRate"
  paramsDF$Name[(row.names(paramsDF)=="pred_preferencesd")] <- "Predation.RevisedPredation.FeedingPreferenceStandardDeviation"
  paramsDF$Name[(row.names(paramsDF)=="pred_lu_attack")] <- "Predation.RevisedPredation.NonPreferredLanduseAttackRateProportion"
  paramsDF$Name[(row.names(paramsDF)=="pred_nummassbins")] <- "Predation.RevisedPredation.NumberOfMassAggregationBins"
  paramsDF$Name[(row.names(paramsDF)=="disp_advective_timeunit")] <- "Dispersal.Advective.TimeUnitImplementation"
  paramsDF$Name[(row.names(paramsDF)=="disp_advective_horizdiffusivity")] <- "Dispersal.Advective.HorizontalDiffusivity"
  paramsDF$Name[(row.names(paramsDF)=="disp_advective_timestephours")] <- "Dispersal.Advective.AdvectiveModelTimeStepLengthHours"
  paramsDF$Name[(row.names(paramsDF)=="disp_diffusive_timeunit")] <- "Dispersal.Diffusive.TimeUnitImplementation"
  paramsDF$Name[(row.names(paramsDF)=="disp_diffusive_massscalar")] <- "Dispersal.Diffusive.DispersalSpeedBodyMassScalar"
  paramsDF$Name[(row.names(paramsDF)=="disp_diffusive_massexponent")] <- "Dispersal.Diffusive.DispersalSpeedBodyMassExponent"
  paramsDF$Name[(row.names(paramsDF)=="disp_responsive_timeunit")] <- "Dispersal.Responsive.TimeUnitImplementation"
  paramsDF$Name[(row.names(paramsDF)=="disp_responsive_densitythresholdscaling")] <- "Dispersal.Responsive.DensityThresholdScaling"
  paramsDF$Name[(row.names(paramsDF)=="disp_responsive_starvationthreshold")] <- "Dispersal.Responsive.StarvationDispersalBodyMassThreshold"
  paramsDF$Name[(row.names(paramsDF)=="disp_responsive_massscalar")] <- "Dispersal.Responsive.DispersalSpeedBodyMassScalar"
  paramsDF$Name[(row.names(paramsDF)=="disp_responsive_massexponent")] <- "Dispersal.Responsive.DispersalSpeedBodyMassExponent"
  paramsDF$Name[(row.names(paramsDF)=="autotrophprocessor_phytoplanktonratio")] <- "AutotrophProcessor.ConvertNPPtoAutotroph.PhytoplanktonConversionRatio"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_maxnpp")] <- "RevisedTerrestrialPlantModel.max_NPP"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_t1npp")] <- "RevisedTerrestrialPlantModel.t1_NPP"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_t2npp")] <- "RevisedTerrestrialPlantModel.t2_NPP"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_pnpp")] <- "RevisedTerrestrialPlantModel.p_NPP"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_structscalar")] <- "RevisedTerrestrialPlantModel.FracStructScalar"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_aevergreen")] <- "RevisedTerrestrialPlantModel.a_FracEvergreen"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_bevergreen")] <- "RevisedTerrestrialPlantModel.b_FracEvergreen"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_cevergreen")] <- "RevisedTerrestrialPlantModel.c_FracEvergreen"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_megmortality")] <- "RevisedTerrestrialPlantModel.m_EGLeafMortality"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_cegmortality")] <- "RevisedTerrestrialPlantModel.c_EGLeafMortality"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_mdmortality")] <- "RevisedTerrestrialPlantModel.m_DLeafMortality"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_cdmortality")] <- "RevisedTerrestrialPlantModel.c_DLeafMortality"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_mfrmortality")] <- "RevisedTerrestrialPlantModel.m_FRootMort"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_cfrmortality")] <- "RevisedTerrestrialPlantModel.c_FRootMort"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_p2smortality")] <- "RevisedTerrestrialPlantModel.p2_StMort"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_p1smortality")] <- "RevisedTerrestrialPlantModel.p1_StMort"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_maxfracstruct")] <- "RevisedTerrestrialPlantModel.MaxFracStruct"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_lfshalfsatfire")] <- "RevisedTerrestrialPlantModel.LFSHalfSaturation_Fire"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_lfsscalarfire")] <- "RevisedTerrestrialPlantModel.LFSScalar_Fire"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_npphalfsatfire")] <- "RevisedTerrestrialPlantModel.NPPHalfSaturation_Fire"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_nppscalarfire")] <- "RevisedTerrestrialPlantModel.NPPScalar_Fire"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_ermin")] <- "RevisedTerrestrialPlantModel.er_min"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_ermax")] <- "RevisedTerrestrialPlantModel.er_max"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_drmin")] <- "RevisedTerrestrialPlantModel.dr_min"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_drmax")] <- "RevisedTerrestrialPlantModel.dr_max"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_frmmin")] <- "RevisedTerrestrialPlantModel.frm_min"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_frmmax")] <- "RevisedTerrestrialPlantModel.frm_max"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_stmmax")] <- "RevisedTerrestrialPlantModel.stm_max"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_stmmin")] <- "RevisedTerrestrialPlantModel.stm_min"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_basescalarfire")] <- "RevisedTerrestrialPlantModel.BaseScalar_Fire"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_minreturninterval")] <- "RevisedTerrestrialPlantModel.MinReturnInterval"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_carbonperleafmass")] <- "RevisedTerrestrialPlantModel.MassCarbonPerMassLeafDryMatter"
  paramsDF$Name[(row.names(paramsDF)=="plants_terr_dryperleafmass")] <- "RevisedTerrestrialPlantModel.MassLeafDryMatterPerMassLeafWetMatter"
  
  write.csv(x = paramsDF,file = "input/Model setup/Ecological definition files/EcologicalParameters.csv",
            quote = FALSE,row.names = FALSE)
  
  if(is.null(scenarios)){
    scenarios <- data.frame(label="NI",npp="no 0.0 0",temperature="no 0.0",
                            harvesting="no 0.0")
    scenarios[,'simulation number'] <- numSims
  } else {
    
  }
  
  write.csv(x = scenarios,file = "input/Model setup/Initial model state setup/Scenarios.csv",
            quote = FALSE,row.names = FALSE)
  
  dir1 <- dir()
  
  shell("Madingley.exe")
  
  dir2 <- dir()
  
  outputDir <- setdiff(dir2,dir1)
  
  setwd(origDir) 
  
  return(list(outputDir=paste(codeDir,"/MadingleyBuild/",outputDir,sep="")))
  
}