# MadingleyR Package

## Getting Started

### Installing Madingley R

To install MadingleyR and MadingleyPlots (which is required for plotting the results of simulations), run the following commands:

```R
library(devtools)
install_github("timnewbold/MadingleyR",subdir = "MadingleyR")
install_github("timnewbold/MadingleyPlots",subdir = "MadingleyPlots")
```

### Running basic simulations

To get started with simple simulations of the Madingley Model, using default settings, you just need to run the following set of commands.

First, load the packages:

```R
library(MadingleyR)
library(MadingleyPlots)
```

Then download the latest release of the Madingley Model:

```R
codeDir <- "C:/Temp"
DownloadRelease(codeDir = codeDir)
```

Then download the necessary input data:

```R
GetMadingleyData(codeDir = codeDir)
```

Now initialize the model, for a 50-year simulation in one grid cell:

```R
init <- MadingleyInitialisation(duration = 50,
                                specific_locations = list(latitudes=2,longitudes=33))
params <- MadingleyParameters()
```

Finally, run the model:
```R
madingleySim <- RunMadingley(codeDir = codeDir,init = init,params = params)
```

### Plotting the basic simulations

To plot the time series of biomass densities by trophic level, simply run the following command:

```R
PlotTemporal(resultsDir = madingleySim$outputDir,plotName = "BiomassDensity")
```