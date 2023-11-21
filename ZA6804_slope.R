# Procedure by Erin M. Buchanan http://statstools.com/learn/structural-equation-modeling/

rm (list= ls()) # start clean
library(lavaan) #SEM-Paket
library(BDgraph)
library(semPlot)
#test <- data.frame(Demo.growth)
za6804.data <- readRDS(file = "./rData/za6804.Rda")
attach(za6804.data)
df.wis <- data.frame(w3_theta_pwk,w5_theta_pwk,w7_theta_pwk,kp1_010,w1_pw,kpx_2280, kpx_2290, kp1_2320,w3_pm)
# df.wis <- data.frame(w4_smpa,w5_smpa,w7_smpa,kp1_010,w1_pw,kpx_2280,kpx_2290,kp1_2320,w3_pm)
#df.int <- data.frame(kp2_010, kp3_010, kp4_010, kp5_010, kp6_010, kp7_010)

detach(za6804.data)
rm(za6804.data)
#cbind(plyr::count(df.smpa, "w4_smpa"),plyr::count(df.smpa, "w5_smpa"),plyr::count(df.smpa, "w7_smpa"))
#df.med <- data.frame(w1_med,w2_med,w3_med)

names(df.wis)<- c("w1_wis", "w2_wis", "w3_wis", "polint", "polwis","sex","alter","schule","polmot") # für Wissen
#names(df.wis)<- c("w1_wis", "w2_wis", "w3_wis", "polint", "polwis","sex","alter","schule") # für Social Media
cbind(plyr::count(df.wis, "w1_wis"),plyr::count(df.wis, "w2_wis"),plyr::count(df.wis, "w3_wis"))
describe(df.wis)
df.wis  <- na.omit(df.wis)
describe(df.wis)
wis_grow1 <- '
# intercept with no variance
# with fixed coefficients
IW =~ 1*w1_wis + 1*w2_wis + 1*w3_wis

# Intercept Variance @0
IW ~~ 0*IW
#Resiudal variance equal over time
w1_wis ~~ r*w1_wis
w2_wis ~~ r*w2_wis
w3_wis ~~ r*w3_wis'
fit1 <- lavaan::growth(wis_grow1, data = df.wis, missing="ML")
lavaan::summary(fit1)
fitmeasures(fit1, c("chisq", "df", "pvalue", "cfi", "rmsea", "srmr"))
wis_grow2 <- '
# intercept with variance
IW =~ 1*w1_wis + 1*w2_wis + 1*w3_wis

#Resiudal variance equal over time
w1_wis ~~ r*w1_wis
w2_wis ~~ r*w2_wis
w3_wis ~~ r*w3_wis'
fit2 <- lavaan::growth(wis_grow2, data = df.wis, missing="ML")
lavaan::summary(fit2)
fitmeasures(fit2, c("chisq", "df", "pvalue", "cfi", "rmsea", "srmr"))

wis_grow3 <- '
# intercept and randon slope
IW =~ 1*w1_wis + 1*w2_wis + 1*w3_wis
SW =~ 0*w1_wis + 1*w2_wis + 2*w3_wis

#Random Slope
SW~0*1
SW~~0*IW

#Resiudal variance equal over time
w1_wis ~~ r*w1_wis
w2_wis ~~ r*w2_wis
w3_wis ~~ r*w3_wis'
fit3 <- lavaan::growth(wis_grow3, data = df.wis, missing="ML")
lavaan::summary(fit3)
fitmeasures(fit3, c("chisq", "df", "pvalue", "cfi", "rmsea", "srmr"))

wis_grow4 <- '
# intercept and  slope
IW =~ 1*w1_wis + 1*w2_wis + 1*w3_wis
SW =~ 0*w1_wis + 1*w2_wis + 2*w3_wis
#Resiudal variance equal over time
w1_wis ~~ r*w1_wis
w2_wis ~~ r*w2_wis
w3_wis ~~ r*w3_wis'
fit4 <- lavaan::growth(wis_grow4, data = df.wis, missing="ML")
lavaan::summary(fit4, fit.measures=F, standardized=TRUE)
fitmeasures(fit4, c("chisq", "df", "pvalue", "cfi", "rmsea", "srmr"))

wis_grow5 <- '
# intercept and  slope
IW =~ 1*w1_wis + 1*w2_wis + 1*w3_wis
SW =~ 0*w1_wis + 1*w2_wis + 2*w3_wis'
fit5 <- lavaan::growth(wis_grow5, data = df.wis, missing="ML")
lavaan::summary(fit5, standardized=T, rsquare=TRUE)
fitmeasures(fit5, c("chisq", "df", "pvalue", "cfi", "rmsea", "srmr"))


wis_grow4r <- '
# intercept and  slope
IW =~ 1*w1_wis + 1*w2_wis + 1*w3_wis
SW =~ 0*w1_wis + 1*w2_wis + 2*w3_wis
#Regression
IW ~ polint + polwis + polmot + schule + alter + sex
SW ~ polint + polwis + polmot + schule + alter + sex
#polint ~~ polwis
#Resiudal variance equal over time
w1_wis ~~ r*w1_wis
w2_wis ~~ r*w2_wis
w3_wis ~~ r*w3_wis'
fit4r <- lavaan::growth(wis_grow4r, data = df.wis, missing="ML", mimic="Mplus")
lavaan::summary(fit4r, standardized=TRUE, rsquare=TRUE)
fitmeasures(fit4r, c("chisq", "df", "pvalue", "cfi", "rmsea", "srmr"))


semPlot::semPaths(fit4, what = "paths", whatLabels="par", layout="tree", intercepts = T, residuals = F)
semPlot::semPaths(fit5, what = "paths", whatLabels="par", layout="tree", intercepts = T, residuals = F)
semPlot::semPaths(fit4r, what = "paths", whatLabels="par", layout="tree", intercepts = T, residuals = F)

# Deskriptive ####
psych::corr.test(df.wis)
attach(df.wis)
df.sm <- data.frame(w1_wis,w2_wis,w3_wis)
detach(df.wis)
ICC(df.sm)

rm(df.sm)

# Vault ####



int_grow4 <- '
# intercept and  slope
IW =~ 1*kp2_010 +1*kp3_010 + 1*kp4_010 +1*kp5_010 +1*kp6_010 + 1*kp7_010
SW =~ 0*kp2_010 +1*kp3_010 + 2*kp4_010 +3*kp5_010 +4*kp6_010 + 5*kp7_010
#Resiudal variance equal over time
#kp2_010 ~~ r*kp2_010
#kp3_010 ~~ r*kp3_010
#kp4_010 ~~ r*kp4_010
#kp5_010 ~~ r*kp5_010
#kp6_010 ~~ r*kp6_010
#kp7_010 ~~ r*kp7_010
'
fit4i <- lavaan::growth(int_grow4, data = df.int, missing="ML")
lavaan::summary(fit4i, fit.measures=TRUE, standardized=TRUE, rsquare=TRUE)
fitmeasures(fit4i, c("chisq", "df", "pvalue", "cfi", "rmsea", "srmr"))

model <- '
  # intercept and slope with fixed coefficients
    i =~ 1*c1 + 1*c2 + 1*c3 + 1*c4
    s =~ 0*c1 + 1*c2 + 2*c3 + 3*c4
  # regressions
    i ~ x1 + x2
    s ~ x1 + x2'
fit <- growth(model, data = Demo.growth)
summary(fit)
