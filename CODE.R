setwd("/Users/rishigurjar/desktop/terrerlab2022")
library(sp)
library(terra)
library(raster)
library(ggplot2)
library(viridis)
library(rasterVis)

# Load data
dat <- raster('/Users/rishigurjar/Desktop/terrerlab2022/AGB_Mangrove/global_mangrove_agb.tif')

# Get properties of the raster
dat

plot(dat)
e <- drawExtent()    # run this line, then click twice on your plot to define a box
cropped_dat <- crop(dat, e)
plot(cropped_dat)
f <- drawExtent()    # run this line, then click twice on your plot to define a box
cropped_dat2 <- crop(cropped_dat, f)
plot(cropped_dat2, main="Above-ground biomass (mangroves) somewhere in SE Asia")






dat <- raster('/Users/rishigurjar/Desktop/terrerlab2022/CMS_Global_Map_Mangrove_Canopy_1665/data/Mangrove_hba95_Indonesia.tif')
dat
plot(dat)
e <- drawExtent()    # run this line, then click twice on your plot to define a box
cropped_dat <- crop(dat, e)
plot(cropped_dat)


