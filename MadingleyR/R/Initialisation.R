MadingleyInit <- function(settings){
  
  init <- list(bottom_lat=-65,
               top_lat=65,
               left_long=-180,
               right_long=180,
               label="MadingleyOutputs",
               cellsize=1,
               timestep="month",
               duration=100,
               burnin=0,
               impact=None,
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
               specific_locations=False,
               save_final_state=False,
               read_state=False)
  
  for (s in settings) {
    init[names(x)] <- x
  }
  
}



