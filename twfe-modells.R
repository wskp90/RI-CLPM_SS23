# for a dataset
library(bacondecomp) 
# for robust standard error estimation
library(lmtest) 
# To calculate correct vcov matrix with 2WFE
library(multiwayvcov) 
# For a package way to do FE
library(plm)



if (!require("pacman")) install.packages("pacman")
pacman::p_load(bacondecomp, lmtest, multiwayvcov, plm)


df <- bacondecomp::castle
# The way with lm. 
fit_tw <- lm(l_homicide ~ post + factor(state) + factor(year), 
             data = df)

# The coefficient of interest is the second in this object. 
vcov_tw <- multiwayvcov::cluster.vcov(fit_tw, 
                                      cbind(df$state, df$year),
                                      use_white = F, 
                                      df_correction = F)
# Just get coefficient of interest
# Here it's the second row from coeftest
coeftest(fit_tw, vcov_tw)[2,] 

defe_plm <- plm(l_homicide ~ post, 
                data = df, 
                index = c("state", "year"), 
                model = "within", 
                effect = "time")



twfe_plm <- plm(l_homicide ~ post, 
               data = df, 
               index = c("state", "year"), 
               model = "within", 
               effect = "twoways")



re_plm <- plm(l_homicide ~ post, 
               data = df, 
               index = c("state", "year"), 
               model = "random", 
               effect = "twoways")

plm::phtest(fe_plm,re_plm)
# Note how this is functionally identical to the lm() way 
coeftest(fe_plm, vcov = vcovHC, type = "HC1")
