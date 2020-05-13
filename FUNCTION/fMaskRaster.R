#########################################################################################################
##Libraries
#########################################################################################################
loadandinstall <- function(mypkg) {
  for(i in seq(along=mypkg)){
    if (!is.element(mypkg[i],installed.packages()[,1])){install.packages(mypkg[i])}
    library(mypkg[i], character.only=TRUE)
  }
}
packages <- sort(c("raster","gtools"))
loadandinstall(packages)
#########################################################################################################
##Function
#########################################################################################################
fCropRaster <- function(SHP.DIR,
                        SHP.PF,
                        RASTER.DIR,
                        RASTER.GRD,
                        RASTER.FRM,
                        RASTER.EPSG,
                        OUT.DIR,
                        MULTI=TRUE){

if(MULTI==TRUE){
r <- stack(paste(RASTER.DIR,RASTER.GRD,RASTER.FRM,sep=""))}
if(MULTI==FALSE){
r <- raster(paste(RASTER.DIR,RASTER.GRD,RASTER.FRM,sep=""))}

setwd(SHP.DIR)
l.s <- mixedsort(list.files(pattern=paste("^(",SHP.PF,").*\\.shp$",sep="")),decreasing=FALSE)  
l.s.df <- data.frame(FILE=l.s)
l.s.df$PID=1:length(l.s)
write.csv2(l.s.df, paste(OUT.DIR,"PLUT.csv"))


pb <- txtProgressBar(min=1, max=length(l.s), style=3) 
for(i in 1:length(l.s)){  
s <- shapefile(file.path(SHP.DIR,l.s[i]),verbose=TRUE)
crs(r) <- CRS(paste("+init=epsg:",RASTER.EPSG,sep=""))
#reproject shape file
s <- spTransform(s, r@crs)
#Crop and mask raster file
r.crop <- crop(r, s)
r.crop <- mask(r.crop, s)
#r.crop = projectRaster(r.crop, crs = "+init=epsg:25832", method = "bilinear")
if(RASTER.FRM==".tif"){
writeRaster(r.crop, filename=paste(RASTER.DIR,RASTER.GRD,"_CROP_",i,RASTER.FRM,sep=""), format="GTiff", overwrite=TRUE)
  }
if(RASTER.FRM==".asc"){
  writeRaster(r.crop, filename=paste(RASTER.DIR,RASTER.GRD,"_CROP",i,RASTER.FRM,sep=""), format="ascii", overwrite=TRUE)}
if(RASTER.FRM==".sdat"){
  writeRaster(r.crop, filename=paste(RASTER.DIR,RASTER.GRD,"_CROP",i,RASTER.FRM,sep=""), format="SAGA", overwrite=TRUE)}
setTxtProgressBar(pb, i)
}
}
     