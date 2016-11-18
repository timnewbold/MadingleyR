# Full list of ecological parameters

This document lists all of the parameters required by the Madingley Model, their default values, and the argument used to define them in the MadingleyParameters function of the MadingleyR package.

### _Reproduction_

Sub-process | MadingleyR argument | Madingley Parameter | Default Value | Description
:---: | :---: | :---: | :---: | :---:
- | reprod_timeunit | Reproduction.Basic.TimeUnitImplementation | 1 (Month) | Time unit used within reproduction
- | reprod_semelparityallocation | Reproduction.Basic.SemelparityAdultMassAllocation | 0.5 | Proportion of body mass semelparous organisms devote to reproduction
- | reprod_massthreshold | Reproduction.Basic.MassRatioThreshold | 1.5 | Threshold ratio of total biomass (including reproductive potential) to adult mass for reproduction to happen
- | reprod_massevolutionthreshold | Reproduction.Basic.MassEvolutionProbabilityThreshold | 0.95 | Probability that must be exceeded for juvenile and adult masses to evolve during reproduction
- | reprod_massevolutionsd | Reproduction.Basic.MassEvolutionStandardDeviation | 0.05 | Standard deviation of normal draw to generate juvenile and adult masses of new cohort

### _Metabolism_

Sub-process | MadingleyR argument | Madingley Parameter | Default Value | Description
:---: | :---: | :---: | :---: | :---:
- | boltzmann | BoltzmannConstant | 0.00008617 | Boltzmann's constant
- | metab_energyscalar | Metabolism.EnergyScalar | 0.036697248 | Scalar used to convert kJ to grams of body mass
Endotherms | metab_endo_timeunit | Metabolism.Endotherm.TimeUnitImplementation | 0 (Day) | Time unit used within metabolism
Endotherms | metab_endo_massexponent | Metabolism.Endotherm.MetabolismMassExponent | 0.7 | Exponent on relationship between field metabolism and body mass
Endotherms | metab_endo_normalization | Metabolism.Endotherm.NormalizationConstant | 9.08E+11 | Mass- and temperature-independent normalization constant for field metabolic rate
Endotherms | metab_endo_activationenergy | Metabolism.Endotherm.ActivationEnergy | 0.69 | Activation energy of metabolism
Ectotherms | metab_ecto_timeunit | Metabolism.Ectotherm.TimeUnitImplementation | 0 (Day) | Time unit used within metabolism
Ecotherms | metab_ecto_massexponent | Metabolism.Ectotherm.MetabolismMassExponent | 0.88 | Exponent on relationship between field metabolism and body mass
Ectotherms | metab_ecto_normalization | Metabolism.Ectotherm.NormalizationConstant | 1.49E+11 | Mass- and temperature-independent normalization constant for field metabolic rate
Ectotherms | metab_ecto_activationenergy | Metabolism.Ectotherm.ActivationEnergy | 0.69 | Activation energy of metabolism
Ectotherms | metab_ecto_basalmassexponent | Metabolism.Ectotherm.BasalMetabolismMassExponent | 0.69 | Exponent on relationship between basal metabolic rate and body mass
Ectotherms | metab_ecto_basalnormalization | Metabolism.Ectotherm.NormalizationConstantBMR | 41918272883 | Mass- and temperature-independent normalization constant for basal metabolic rate

### _Activity_

Sub-process | MadingleyR argument | Madingley Parameter | Default Value | Description
:---: | :---: | :---: | :---: | :---:
Terrestrial | activity_terr_wtintercept | Activity.Terrestrial.WarmingToleranceIntercept | 6.61 | Intercept of relationship between warming tolerance of ectotherms and annual temperature variability
Terrestrial | activity_terr_wtslope | Activity.Terrestrial.WarmingToleranceSlope | 1.6 | Slope of relationship between warming tolerance of ectotherms and annual temperature variability
Terrestrial | activity_terr_tsmintercept | Activity.Terrestrial.TSMIntercept | 1.51 | Intercept of relationship between safety margin of ectotherms and annual temperature variability
Terrestrial | activity_terr_tsmslope | Activity.Terrestrial.TSMSlope | 1.53 | Slope of relationship between safety margin of ectotherms and annual temperature variability

### _Mortality_

Sub-process | MadingleyR argument | Madingley Parameter | Default Value | Description
:---: | :---: | :---: | :---: | :---:
Background | mort_bg_timeunit | Mortality.Background.TimeUnitImplementation | 0 (Day) | Time unit used within mortality
Background | mort_bg_mortrate | Mortality.Background.MortalityRate | 0.001 | Background rate of mortality
Background | mort_bg_massslope | Mortality.Background.MassSlope | 0 | The slope of the relationship between body mass and background mortality
Background | mort_bg_lufactor | Mortality.Background.NonPreferredLanduseMortalityFactor | 1.0 | Factor by which the mortality rate is modified in non-preferred land uses
Senescence | mort_sen_timeunit | Mortality.Senescence.TimeUnitImplementation | 0 (Day) | Time unit used within mortality
Senescence | mort_sen_mortrate | Mortality.Senescence.MortalityRate | 0.003 | Rate of mortality at maturity (increases exponentially thereafter)
Senescence | mort_sen_massslope | Mortality.Senescence.MassSlope | 0 | The slope of the relationship between body mass and senescence mortality
Starvation | mort_starv_timeunit | Mortality.Starvation.TimeUnitImplementation | 0 (Day) | Time unit used within mortality
Starvation | mort_starv_inflection | Mortality.Starvation.LogisticInflectionPoint | 0.6 | Inflection point of the relationship between body mass loss and starvation
Starvation | mort_starv_scaling | Mortality.Starvation.LogisticScalingParameter | 0.05 | Steepness of the relationship between body mass loss and starvation
Starvation | mort_starv_maxrate | Mortality.Starvation.MaximumStarvationRate | 1 | Maximum rate of starvation under maximum body mass loss

### Herbivory

Sub-process | MadingleyR argument | Madingley Parameter | Default Value | Description
:---: | :---: | :---: | :---: | :---:
- | herb_timeunit | Herbivory.RevisedHerbivory.TimeUnitImplementation | 0 (Day) | Time unit used within herbivory
- | herb_handlingrefmass | Herbivory.RevisedHerbivory.HandlingTimeReferenceMass | 1 | Reference herbivore mass for calculating handling time
- | herb_ratemassexponent | Herbivory.RevisedHerbivory.RateMassExponent | 1 | Exponent applied to herbivore mass in calculation of herbivory rate
- | herb_rateconstant | Herbivory.RevisedHerbivory.RateConstant | 1.00E-11 | Maximum herbivory rate for a herbivore of 1 g mass
Marine | herb_marine_handlingscalar | Herbivory.RevisedHerbivory.Marine.HandlingTimeScalar | 0.7 | Scalar of the relationship between handling time and the reciprocal of herbivore mass
Marine | herb_marine_handlingexponent | Herbivory.RevisedHerbivory.Marine.HandlingTimeExponent | 0.7 | Exponent of the relationship between handling time and the reciprocal of herbivore mass
Marine | herb_marine_attackexponent | Herbivory.RevisedHerbivory.Marine.AttackRateExponent | 2 | Exponent applied to prey density when calculating attack rate
Terrestrial | herb_terr_handlingscalar | Herbivory.RevisedHerbivory.Terrestrial.HandlingTimeScalar | 0.7 | Scalar of the relationship between handling time and the reciprocal of herbivore mass
Terrestrial | herb_terr_handlingexponent | Herbivory.RevisedHerbivory.Terrestrial.HandlingTimeExponent | 0.7 | Exponent of the relationship between handling time and the reciprocal of herbivore mass
Terrestrial | herb_terr_attackexponent | Herbivory.RevisedHerbivory.Terrestrial.AttackRateExponent | 2 | Exponent applied to prey density when calculating attack rate
Terrestrial | herb_lu_attack | Herbivory.RevisedHerbivory.NonPreferredLanduseAttackRateProportion | 0.9 | Proportional attack rate realised in non-preferred land uses

### Predation
Sub-process | MadingleyR argument | Madingley Parameter | Default Value | Description
:---: | :---: | :---: | :---: | :---:
- | pred_timeunit | Predation.RevisedPredation.TimeUnitImplementation | 0 (Day) | Time unit used within predation
- | pred_handlingrefmass | Predation.RevisedPredation.HandlingTimeReferenceMass | 1 | Reference predator mass for calculating handling time
- | pred_killconstantmassexponent | Predation.RevisedPredation.KillRateConstantMassExponent | 1 | Exponent applied to predator mass in calculation of predation rate
- | pred_killrateconstant | Predation.RevisedPredation.KillRateConstant | 0.000001 | Maximum predation rate for a predator of 1 g mass on prey of optimal mass
- | pred_preferencesd | Predation.RevisedPredation.FeedingPreferenceStandardDeviation | 0.7 | Standard deviation of preference around the optimal (log) predator-prey mass ratio
- | pred_lu_attack | Predation.RevisedPredation.NonPreferredLanduseAttackRateProportion | 0.9 | Proportional attack rate realised in non-preferred land uses
- | pred_nummassbins | Predation.RevisedPredation.NumberOfMassAggregationBins | 12 | Number of mass bins into which predators are aggregated (to speed up predation calculations)
Marine | pred_marine_handlingscalar | Predation.RevisedPredation.Marine.HandlingTimeScalar | 0.5 | Scalar of the relationship between handling time and the reciprocal of predator mass
Marine | pred_marine_handlingexponent | Predation.RevisedPredation.Marine.HandlingTimeExponent | 0.7 | Exponent of the relationship between handling time and the reciprocal of predator mass
Terrestrial | pred_terr_handlingscalar | Predation.RevisedPredation.Terrestrial.HandlingTimeScalar | 0.5 | Scalar of the relationship between handling time and the reciprocal of predator mass
Terrestrial | pred_terr_handlingexponent | Predation.RevisedPredation.Terrestrial.HandlingTimeExponent | 0.7 | Exponent of the relationship between handling time and the reciprocal of predator mass
Terrestrial | pred_terr_handlingpreyexp | Predation.RevisedPredation.Terrestrial.HandlingTimePreyExponentTerrestrial | 1.0 | Exponent of the relationship between handling time and prey mass
Terrestrial | activationhandlingtime | Predation.RevisedPredation.Terrestrial.ActivationEnergyHandlingTime | -0.27 | The activation energy for calculating the temperature-dependence of handling time
Terrestrial | activationattackrate | Predation.RevisedPredation.ActivationEnergyAttackRate | 0.44 | The activation energy for calculating the temperature-dependence of attack rate

### Dispersal

Sub-process | MadingleyR argument | Madingley Parameter | Default Value | Description
:---: | :---: | :---: | :---: | :---:
Advective | disp_advective_timeunit | Dispersal.Advective.TimeUnitImplementation | 1 (Month) | Time unit used within dispersal
Advective | disp_advective_horizdiffusivity | Dispersal.Advective.HorizontalDiffusivity | 100 | Diffusivity of planktonic organisms
Advective | disp_advective_timestephours | Dispersal.Advective.AdvectiveModelTimeStepLengthHours | 18 | Length of time steps (can be different to time units for calculations)
Diffusive | disp_diffusive_timeunit | Dispersal.Diffusive.TimeUnitImplementation | 1 (Month) | Time unit used within dispersal
Diffusive | disp_diffusive_massscalar | Dispersal.Diffusive.DispersalSpeedBodyMassScalar | 0.0278 | Scalar of relationship between body mass and dispersal speed
Diffusive | disp_diffusive_massexponent | Dispersal.Diffusive.DispersalSpeedBodyMassExponent | 0.48 | Exponent of the relationship between body mass and dispersal speed
Responsive | disp_responsive_timeunit | Dispersal.Responsive.TimeUnitImplementation | 1 (Month) | Time unit used within dispersal
Responsive | disp_responsive_densitythresholdscaling | Dispersal.Responsive.DensityThresholdScaling | 50000 | Scalar of the relationship between cohort mass and the density below which dispersal occurs
Responsive | disp_responsive_starvationthreshold | Dispersal.Responsive.StarvationDispersalBodyMassThreshold | 0.8 | Threshold mass (as a proportion of mass ever achieved) below which dispersal occurs
Responsive | disp_responsive_massscalar | Dispersal.Responsive.DispersalSpeedBodyMassScalar | 0.0278 | Scalar of relationship between body mass and dispersal speed
Responsive | disp_responsive_massexponent | Dispersal.Responsive.DispersalSpeedBodyMassExponent | 0.48 | Exponent of the relationship between body mass and dispersal speed

### Plants

Sub-process | MadingleyR argument | Madingley Parameter | Default Value | Description
:---: | :---: | :---: | :---: | :---:
Marine | autotrophprocessor_phytoplanktonratio | AutotrophProcessor.ConvertNPPtoAutotroph.PhytoplanktonConversionRatio | 10.0 | Factor to convert phytoplankton biomass from grams carbon to grams wet weight
Terrestrial | plants_terr_maxnpp | RevisedTerrestrialPlantModel.max_NPP | 0.961644704 | Maximum possible NPP (g C per m2 per year)
Terrestrial | plants_terr_t1npp | RevisedTerrestrialPlantModel.t1_NPP | 0.237468183 | First constant in the logistic model relating NPP to temperature
Terrestrial | plants_terr_t2npp | RevisedTerrestrialPlantModel.t2_NPP | 0.100597089 | Second constant in the logistic model relating NPP to temperature
Terrestrial | plants_terr_pnpp | RevisedTerrestrialPlantModel.p_NPP | 0.001184101 | Constant in the saturating function relating NPP to precipitation
Terrestrial | plants_terr_structscalar | RevisedTerrestrialPlantModel.FracStructScalar | 7.154615419 | Scalar in the function relating structural allocation to NPP
Terrestrial | plants_terr_aevergreen | RevisedTerrestrialPlantModel.a_FracEvergreen | 1.270782192 | Quadratic coefficient relating evergreen allocation to frost-season length
Terrestrial | plants_terr_bevergreen | RevisedTerrestrialPlantModel.b_FracEvergreen | -1.828591558 | Linear coefficient relating evergreen allocation to frost-season length
Terrestrial | plants_terr_cevergreen | RevisedTerrestrialPlantModel.c_FracEvergreen | 0.844864063 | Intercept in relationship between evergreen allocation and frost-season length
Terrestrial | plants_terr_megmortality | RevisedTerrestrialPlantModel.m_EGLeafMortality | 0.040273936 | Slope of the relationship between temperature and evergreen leaf mortality
Terrestrial | plants_terr_cegmortality | RevisedTerrestrialPlantModel.c_EGLeafMortality | 1.013070062 | Intercept of the relationship between temperature and evergreen leaf mortality
Terrestrial | plants_terr_mdmortality | RevisedTerrestrialPlantModel.m_DLeafMortality | 0.020575964 | Slope of the relationship between temperature and deciduous leaf mortality
Terrestrial | plants_terr_cdmortality | RevisedTerrestrialPlantModel.c_DLeafMortality | -1.195235464 | Intercept of the relationship between temperature and deciduous leaf mortality
Terrestrial | plants_terr_mfrmortality | RevisedTerrestrialPlantModel.m_FRootMort | 0.04309283 | Slope of the relationship between temperature and fine-root mortality
Terrestrial | plants_terr_cfrmortality | RevisedTerrestrialPlantModel.c_FRootMort | -1.478393163 | Intercept of the relationship between temperature and fine-root mortality
Terrestrial | plants_terr_p1smortality | RevisedTerrestrialPlantModel.p1_StMort | -4.395910091 | First parameter in the structural-mortality function
Terrestrial | plants_terr_p2smortality | RevisedTerrestrialPlantModel.p2_StMort | 0.139462774 | Second parameter in the structural-mortality function
Terrestrial | plants_terr_maxfracstruct | RevisedTerrestrialPlantModel.MaxFracStruct | 0.362742634 | Maximum fraction of primary productivity that can be allocated to structural tissue
Terrestrial | plants_terr_lfshalfsatfire | RevisedTerrestrialPlantModel.LFSHalfSaturation_Fire | 0.388125108 | Fire-season length at which fire mortality reaches half its maximum value
Terrestrial | plants_terr_lfsscalarfire | RevisedTerrestrialPlantModel.LFSScalar_Fire | 19.98393943 | Scalar relating fire mortality rate to fire-season length
Terrestrial | plants_terr_npphalfsatfire | RevisedTerrestrialPlantModel.NPPHalfSaturation_Fire | 1.148698636 | NPP at which fire mortality reaches half its maximum rate
Terrestrial | plants_terr_nppscalarfire | RevisedTerrestrialPlantModel.NPPScalar_Fire | 8.419032427 | Scalar relating fire mortality rate to NPP
Terrestrial | plants_terr_ermin | RevisedTerrestrialPlantModel.er_min | 0.01 | Minimum rate of evergreen leaf mortality
Terrestrial | plants_terr_ermax | RevisedTerrestrialPlantModel.er_max | 24.0 | Maximum rate of evergreen leaf mortality
Terrestrial | plants_terr_drmin | RevisedTerrestrialPlantModel.dr_min | 0.01 | Minumum rate of deciduous leaf mortality
Terrestrial | plants_terr_drmax | RevisedTerrestrialPlantModel.dr_max | 24.0 | Maximum rate of deciduous leaf mortality
Terrestrial | plants_terr_frmmin | RevisedTerrestrialPlantModel.frm_min | 0.01 | Minimum rate of fine-root mortality
Terrestrial | plants_terr_frmmax | RevisedTerrestrialPlantModel.frm_max | 12.0 | Maximum rate of fine-root mortality
Terrestrial | plants_terr_stmmin | RevisedTerrestrialPlantModel.stm_min | 0.001 | Minimum rate of structural mortality
Terrestrial | plants_terr_stmmax | RevisedTerrestrialPlantModel.stm_max | 1.0 | Maximum rate of structural mortality
Terrestrial | plants_terr_basescalarfire | RevisedTerrestrialPlantModel.BaseScalar_Fire | 2.0 | Base scalar for the fire mortality function
Terrestrial | plants_terr_minreturninterval | RevisedTerrestrialPlantModel.MinReturnInterval | 2.26033E-06 | Minimum fire-return interval
Terrestrial | plants_terr_carbonperleafmass | RevisedTerrestrialPlantModel.MassCarbonPerMassLeafDryMatter | 0.476 | Scalar to convert between mass of carbon and mass of leaf dry matter
Terrestrial | plants_terr_dryperleafmass | RevisedTerrestrialPlantModel.MassLeafDryMatterPerMassLeafWetMatter | 0.213 | Scalar to convert between mass of leaf dry matter and mass of leaf wet matter