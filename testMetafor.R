sc <- read.csv("/Users/rishigurjar/Desktop/terrerlab2022/sc.csv")
library(metafor)
view(sc)

dat_sc <- escalc(measure="ROM", m1i=beforeMean, n1i= beforeN, n2i = afterN, sd1i=beforeSTD, m2i=afterMean, sd2i=afterSTD, data=sc)

?escalc #double check whether the groups are wrong ordered

# Fit a random-effects model to the data
res <- rma(yi, vi, data=dat_sc, mods = ~afterDist-1)

# Print the summary of the meta-analysis
summary(res)
