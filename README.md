# fMask
* Masking of gridded geodata by shape files
* Author: Markus Möller, email: markus.moeller@julius-kuehn.de

## Functions
### fSplit.R
##### Function to split single-part polygone shapes
##### Parameter:
- IN.DIR = directory of input data
- OUT.DIR = directory of output data
- SHP = single-part shape file (without file extension)
- EPSG = EPSG code (https://spatialreference.org)
- SPLIT.ID = column name, which should be used as split-ID
##### Example
fsplit(IN.DIR = ".../fMask/INPUT/",
       OUT.DIR = ".../fMask/INPUT/",
       SHP = "Parzellen",
       EPSG = 25833,
       SPLIT.ID = "id")

###  fMaskRaster.R
####
