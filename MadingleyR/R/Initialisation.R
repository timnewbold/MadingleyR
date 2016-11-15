MadingleyInitialisation <- function(bottom_lat=-65,
                          top_lat=65,
                          left_long=-180,
                          right_long=180,
                          label="MadingleyOutputs",
                          cellsize=1,
                          timestep="month",
                          duration=100,
                          burnin=0,
                          impact="None",
                          recovery=0,
                          parallel_cells="yes",
                          parallel_simulations="no",
                          single_realm="",
                          random="yes",
                          extinction_threshold=1,
                          max_cohorts=1000,
                          track_processes="no",
                          track_crosscell_processes="no",
                          track_global_processes="no",
                          output_detail="medium",
                          output_metrics="no",
                          track_land_use="no",
                          live_outputs="no",
                          specific_locations=list(latitudes=2,
                                                  longitudes=33),
                          save_final_state=FALSE,
                          read_state=FALSE){
  
  init <- list(bottom_lat=bottom_lat,
               top_lat=top_lat,
               left_long=left_long,
               right_long=right_long,
               label=label,
               cellsize=cellsize,
               timestep=timestep,
               duration=duration,
               burnin=burnin,
               impact=impact,
               recovery=recovery,
               parallel_cells=parallel_cells,
               parallel_simulations=parallel_simulations,
               single_realm=single_realm,
               random=random,
               extinction_threshold=extinction_threshold,
               max_cohorts=max_cohorts,
               track_processes=track_processes,
               track_crosscell_processes=track_crosscell_processes,
               track_global_processes=track_global_processes,
               output_detail=output_detail,
               output_metrics=output_metrics,
               track_land_use=track_land_use,
               live_outputs=live_outputs,
               specific_locations=ifelse(is.null(locations),FALSE,TRUE),
               save_final_state=save_final_state,
               read_state=read_state)
  
  if (is.null(specific_locations)){
    locations <- NULL
  } else {
    locations <- data.frame(Latitude=specific_locations$latitudes,
                            Longitude=specific_locations$longitudes)
  }
  
  return(list(init=init,locations=locations))
  
}



