# MadingleyR Package

## Getting Started

To get started with simple simulations of the Madingley Model, using default settings, you just need to run the following set of commands.

First, load the package:

```R
library(MadingleyR)
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

Finally, run the model:
```R
RunMadingley(codeDir = codeDir)
```