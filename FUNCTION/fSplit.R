#########################################################################################################
##Libraries
#########################################################################################################
loadandinstall <- function(mypkg) {
  for(i in seq(along=mypkg)){
    if (!is.element(mypkg[i],installed.packages()[,1])){install.packages(mypkg[i])}
    library(mypkg[i], character.only=TRUE)
  }
}
packages <- sort(c("raster","sf"))
loadandinstall(packages)


fSplit <- function(IN.DIR,
                   OUT.DIR,
                   SHP,
                   EPSG,
                   SPLIT.ID){
s <- st_read(paste(IN.DIR,SHP,".shp",sep=""))
#reproject x according to r
s <- st_transform(s, st_crs(EPSG))
#calculating HECTARES
s$HECTARES <- st_area(s)/10000
#split and export 
l.s <- split(s,s[[paste(SPLIT.ID,sep="")]])
for(i in 1:length(l.s)){
st_write(l.s[[i]],paste(OUT.DIR,SHP,names(l.s[i]),"_EPSG",EPSG,".shp",sep=""),update = TRUE)
}
}
