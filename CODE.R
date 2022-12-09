library(tidyverse)
library(ggplot2)
library(tidyr)
library(dplyr)
library(viridis)
library(tidyverse)
library(sf)
library(mapview)
library(ggpubr)
library(broom)
library(AICcmodavg)
library(metafor)

dat <- read.csv("/Users/rishigurjar/Desktop/terrerlab2022/Selected-Atwood_2017_edited_data.csv")

#ggplot(dat, aes(x=Country, y= Mangrove.A..km..2...of.country., fill=Country))+
#  geom_col()


dat1 <- filter(dat, Country == 'Indonesia')
#View(dat1)

mapviewOptions(fgb = FALSE)

mapview(dat, xcol = "Longitude", ycol = "Latitude", zcol = "Year", crs = 4269, grid = FALSE)

mapview(dat1, xcol = "Longitude", ycol = "Latitude", legend = TRUE, zcol = "Year", crs = 4269, grid = FALSE)

#------------------- Map plot of locations of Sanderman 2018 ----------------
dat2 <- read.csv("/Users/rishigurjar/Desktop/terrerlab2022/Sanderman_2018_arranged.csv")
dat2$Latitude <- as.numeric(dat2$Latitude)                # First column is a factor
dat2$Longitude <- as.numeric(dat2$Longitude)                # First column is a factor

dat2rev <- filter(dat2, Latitude != "contact data owner")
dat2rev <- filter(dat2, Longitude != "")

mapview(dat2rev, xcol = "Longitude", ycol = "Latitude", zcol = "Years_collected", legend = TRUE, crs = 4269, grid = FALSE)

#str(dat2)
#View(dat2)

#dat2$SiteNum<-gsub("M","",as.character(dat2$SiteNum))
#dat2 %>% arrange(desc(SiteNum))
#write.csv(dat2, "Sanderman_2018_arranged.csv")

#------------------- Plots of Sasimoto 2019 ----------------
dat3 <- read.csv("/Users/rishigurjar/Desktop/terrerlab2022/Sasmito_2019.csv")
#view(dat3)
dat3_sc <- filter(dat3, Type == "Soil carbon stock")
dat3_acs <- filter(dat3, Type == "Aboveground carbon stock")
dat3_bcs <- filter(dat3, Type == "Belowground carbon stock")
dat3_sco2e <- filter(dat3, Type == "Soil CO2 efflux")

#dat3_sc_undist <- filter(dat3_sc, Dist == "Undisturbed")
#View(dat3_sc_undist)
mapview(dat3_sc, xcol = "Long", ycol = "Lat", zcol = "Dist", legend = TRUE, crs = 4269, grid = FALSE)

View(dat3_sc)

ggplot(dat3_sc) +
  aes(x = Dist, y = Mean, fill = Dist) +
  geom_boxplot(shape = "circle") +
  scale_fill_viridis_d(option = "viridis", 
                       direction = 1) +
  labs(x = "General disturbance type", y = "Soil carbon stock (Mg-C ha-1)", title = "General Disturbance Type vs. Soil Carbon Stocks", 
       fill = "General Disturbance Type") +
  theme_minimal()+
  geom_jitter()
#find more agri data

undist = dat3_sc[ which(dat3_sc$Dist == 'Undisturbed'), ]
agri = dat3_sc[ which(dat3_sc$Dist == 'Agriculture'), ]
aqua = dat3_sc[ which(dat3_sc$Dist == 'Aquaculture'), ]
logg = dat3_sc[ which(dat3_sc$Dist == 'Logging'), ]


mean(undist$Mean)
mean(agri$Mean)

t.test(undist$Mean, agri$Mean)
#.00003258 Between Undisturbed and Agriculture SC stocks *

t.test(undist$Mean, aqua$Mean)
#.004035 Between Undisturbed and Aquaculture SC stocks *

t.test(undist$Mean, logg$Mean)
#.8657 Between Undisturbed and Logging

#summary(dat3_sc)
ANOVA <- aov(Mean ~ Dist, data = dat3_sc)
summary(ANOVA)
# F value is 0.0702 between SC stocks and disturbance

ANOVA <- aov(Mean ~ Dist, data = dat3_acs)
summary(ANOVA)
# F value is .00000000205 between Above Ground Carbon stocks and disturbance *

ANOVA <- aov(Mean ~ Dist, data = dat3_bcs)
summary(ANOVA)
# F value is .0000000609 between Below Ground Carbon stocks and disturbance *

ANOVA <- aov(Mean ~ Dist, data = dat3_sco2e)
summary(ANOVA)
# F value is .992 between Soil CO2 Efflux and disturbance


ggplot(dat3) +
  aes(x = Dist, y = Mean, fill = Dist) +
  geom_boxplot(shape = "circle") +
  scale_fill_viridis_d(option = "viridis", 
                       direction = 1) +
  labs(x = "General disturbance type", y = "Mangrove factors", title = "General Disturbance Type vs. Mangrove factors", 
       fill = "General Disturbance Type") +
  theme_minimal()+
  geom_jitter(size=.5)+
  facet_wrap(~Type, scales = "free")+
  theme(axis.text.x = element_text(angle = 30, vjust = 0.5, hjust=1))

dat3_soilco2 <- filter(dat3, Type == "Soil CO2 efflux")
#View(dat3_soilco2)

dat3_soilco2 <- filter(dat3_soilco2, Site != "Chwaka bay") #Removing heavy outlier

ggplot(dat3_soilco2) +
  aes(x = Dist, y = Mean, fill = Dist) +
  geom_boxplot(shape = "circle") +
  scale_fill_viridis_d(option = "viridis", 
                       direction = 1) +
  labs(x = "General disturbance type", y = "Soil CO2 Efflux (mmol m-2 day-1)", title = "General Disturbance Type vs. Soil CO2 Efflux", 
       fill = "General Disturbance Type") +
  theme_minimal()+
  geom_jitter()
