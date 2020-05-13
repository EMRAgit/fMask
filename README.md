# fMask
* Masking of gridded geodata by shape files
* Author: Markus Möller, email: markus.moeller@julius-kuehn.de

## Functions
### fSplit.R
#### Function to split single-part polygone shapes
#### Parameter:
- IN.DIR = directory of input data
- OUT.DIR = directory of output data
- SHP = single-part shape file (without file extension)
- EPSG = EPSG code (https://spatialreference.org)
- SPLIT.ID = column name, which should be used as split-ID
#### Example:
fsplit(IN.DIR = ".../fMask/INPUT/",
       OUT.DIR = ".../fMask/INPUT/",
       SHP = "Parzellen",
       EPSG = 25833,
       SPLIT.ID = "id")

###  fMaskRaster.R
#### Function to mask gridded geodata by means of polygon shape files
#### Parameter
- SHP.DIR = directory of shape files
- SHP.PF = Prefix of shape files
- RASTER.DIR = directory of raster files
- RASTER.GRD = name of raster file (without extension)
- RASTER.FRM = raster format (tif, asc, sdat)
- RASTER.EPSG = EPSG code (https://spatialreference.org)
- OUT.DIR= directory of output data
- MULTI = multi- or single layer raster (TRUE or FALSE)
#### Example
fMaskRaster(SHP.DIR = ".../fMask/OUTPUT/",
            SHP.PF = "Parzellen",
            RASTER.DIR = ".../fMask/INPUT/",
            RASTER.GRD = "20200427_rgb_dd_6cm",
            RASTER.FRM = ".tif",
            RASTER.EPSG = 25833,
            OUT.DIR = ".../fMask/OUTPUT/",
            MULTI = TRUE)
