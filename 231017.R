rm(list= ls()) # start clean ####
if (!require("pacman")) install.packages("pacman")
pacman::p_load(sjlabelled,foreign,tidyverse,sjmisc,Hmisc,panelr,gt,gtExtras,gtsummary,
               here,fs,usethis,labelled,janitor,magrittr,qs,tictoc,
               psych,easystats,irr,lavaan,semTools,semPlot,broom,tidySEM)


orgdat = qread("C:/mein Verzeichnis/faubox/")
orgdat = qread(paste0(Sys.getenv("FAUBOX"),"/GLES/za6838/za6838_7729.qs"))
semdat = orgdat %>%
  select(ends_with(c("_1290","_160p","_1500")) & starts_with(c("kp10","kp12","kp14","kp15","kp16")))
semdat %>% select("kp10_1500") %>% frq

semdat = semdat %>% mutate(across(everything(), ~rec(., rec = "-99:-1=NA;else = copy")))
semdat %<>% mutate(across(everything(), ~rec(., rec = "-99:-1=NA;else = copy")))

semdat %>% 
  psych::cor.plot(.,stars = T)
orgdat %>% select("kp10_160p") %>% frq
orgdat %>% select("kp10_1290") %>% frq
orgdat %>% select(ends_with("_2320")) %>% frq
school -> orgdat %>% mutate(across(c("kp1_2320","kp9_2320","kpa2_2320"), ~ as.numeric(as.character(.))),
                   kp1_2320 = ifelse(kp1_2320 > 0 & kp9_2320 > 0, kp9_2320, kp1_2320), 
                   kp1_2320 = ifelse(kp1_2320 < 0 & kpa2_2320 > 0, kpa2_2320, kp1_2320))

semdat %>% select(ends_with("1500")) %>% corr.test()

lm(kp12_1500 ~ kp10_1500 + kp12_160p + kp12_1290, semdat)

semdat$kp12_160p = as.factor(semdat$kp12_160p)

   model1 = semdat %>% lm(.,kp12_1500 ~ kp10_1500 + kp12_160p + kp12_1290)

glance(model1)
tidy(model1)


