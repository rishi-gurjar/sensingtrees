setwd("/Users/rishigurjar/desktop/terrerlab2022")

# Load packages

# If you haven't installed the packages before, use e.g.:
# install.packages("sp")

library(sp)
library(rgdal)
library(raster)
library(ggplot2)
library(viridis)
library(rasterVis)

# Load data
tay <- raster('/Users/rishigurjar/Desktop//Users/rishigurjar/Desktop/taycrop.tifff')

# Get properties of the Tay raster
tay

b1 <- raster('/Users/rishigurjar/Desktop/taycrop.tiff', band=1)
b2 <- raster('/Users/rishigurjar/Desktop/taycrop.tiff', band=2)
b3 <- raster('/Users/rishigurjar/Desktop/taycrop.tiff', band=3)
b4 <- raster('/Users/rishigurjar/Desktop/taycrop.tiff', band=4)
b5 <- raster('/Users/rishigurjar/Desktop/taycrop.tiff', band=5)
b6 <- raster('/Users/rishigurjar/Desktop/taycrop.tiff', band=6)
b7 <- raster('/Users/rishigurjar/Desktop/taycrop.tiff', band=7)
b8 <- raster('/Users/rishigurjar/Desktop/taycrop.tiff', band=8)
b9 <- raster('/Users/rishigurjar/Desktop/taycrop.tiff', band=9)
b10 <- raster('/Users/rishigurjar/Desktop/taycrop.tiff', band=10)
b11 <- raster('/Users/rishigurjar/Desktop/taycrop.tiff', band=11)
b12 <- raster('/Users/rishigurjar/Desktop/taycrop.tiff', band=12)

compareRaster(b2, b3)


plot(b8)

image(b8)

image(b8, col= viridis_pal(option="D")(10), main="Sentinel 2 image of Loch Tay")
