#Function to create single shape polygons from a 
source("e:/PH_R-Wunsch/FUNCTION/fSplit.R")
fSplit(IN.DIR="...",
       SHP="...",
       OUT.DIR="...",
       EPSG=25833,
       SPLIT.ID="...")


#Function to mask gridded raster data
source("e:/PH_R-Wunsch/FUNCTION/fCropRaster.R")
fCropRaster(SHP.DIR="...",
            SHP.PF="...",
            RASTER.DIR="...",
            RASTER.GRD="...",
            RASTER.FRM=".tif",
            RASTER.EPSG=25833,
            OUT.DIR="...",
            MULTI=TRUE)






