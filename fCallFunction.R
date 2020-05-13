#Function to create single shape polygons from a 
source("e:/PH_R-Wunsch/FUNCTION/fSplit.R")
fSplit(IN.DIR="e:/PH_R-Wunsch/INPUT/",
       SHP="Parzellen",
       OUT.DIR="e:/PH_R-Wunsch/OUTPUT/",
       EPSG=25833,
       SPLIT.ID="id")


#Function to 



source("e:/PH_R-Wunsch/FUNCTION/fCropRaster.R")
fCropRaster(SHP.DIR="e:/PH_R-Wunsch/OUTPUT/",
            SHP.PF="Parzellen",
            RASTER.DIR="e:/PH_R-Wunsch/INPUT/",
            RASTER.GRD="20200427_rgb_dd_6cm",
            RASTER.FRM=".tif",
            RASTER.EPSG=25833,
            OUT.DIR="e:/PH_R-Wunsch/OUTPUT/",
            MULTI=TRUE)






