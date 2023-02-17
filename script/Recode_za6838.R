rm(list= ls()) # start clean ####
if (!require("pacman")) install.packages("pacman")
pacman::p_load(sjlabelled,foreign,
               psych,lm.beta, GPArotation,flextable,semTools,semPlot,lavaan,tidyverse,sjmisc,TAM,Hmisc,here,broom,questionr,codebook,DataExplorer,tidySEM,fs,usethis,labelled,magrittr,janitor)
load(paste0(Sys.getenv("FAUBOX"),"/GLES/za6838/za6838_w1-w15.Rda"))
za6838kum %<>% mutate(across(contains(c("_3320","_2180","_040","_5000","_050","3103","_060","_5010","_160","_2200","_1555","_1570")), ~rec(., rec = "-99,-95,-93=NA; else = copy")))
za6838kum %<>% mutate(across(contains(c("_4043","_4044","_4045","_4046")), ~rec(., rec = "-99,-95,-93=NA; else = copy")))



za6838kum %>% select(contains("kp15_4045")) %>% frq

za6838kum %<>% mutate(across(contains("3103"), ~rec(., rec = "NA=-99; else = copy")))


za6838kum %>% tabyl(kp5_3103a,kp8_3103a) %>% adorn_totals("row") %>% adorn_totals("col")



za6838kum %>% select(starts_with("kp15_404")) %>%  psych::alpha(check.keys = T)

load(paste0(Sys.getenv("FAUBOX"),"/GLES/za6838/za6838_w1-w15.Rda"))
za6838kum %<>% mutate(across(contains("3320"), ~rec(., rec = "-99,-95,-93=NA; else = copy")))

za6838kum %>% select(kp1_2320) %>% frq
za6838kum = za6838kum %>%  mutate(kp1_2320 = coalesce(kp1_3320, kpa2_3320))


za6838kum %>% select(starts_with("kp1_3320")) %>% frq


kp1 = za6838kum %>% select(starts_with("kp1_3320")) %>% colnames()
kpa2 =za6838kum %>% select(starts_with("kpa2_3320")) %>% colnames()

kp1 = kp1[-c(6,18)]

kp3320 <- list(kp1,kpa2)

za6838kum = za6838kum %>% map(kp3320, ~mutate(.$kp1 = coalesce(.$kp1, .$kpa2)))


johnny = function(mydata,i,j)
{
  tag <- c(i,j)
  lst <- lapply(tag, function(x) {mydata[grepl(x, colnames(mydata))] })
  ext <- lapply(seq_along(lst), function(x) {
    str_extract(colnames(lst[[x]]), pattern = "(?<=_)\\w{5}") })
  int <- intersect(ext[[1]], ext[[2]])
  match_list <- lapply(lst, function(x) {
    select(x, matches(paste(int, collapse = "|"))) })
  res <- mapply(function(x, y) { replace(x, is.na(x), y[is.na(x)]) }, 
                match_list[[1]], match_list[[2]])
  mydata[,colnames(res)] <- res
  return(mydata)
}




za6838kum = johnny(za6838kum,"kp1_3320","kpa2_3320")
za6838kum |> select(contains("3320a")) %>% frq

# dataframe = johnny




za6838kum %>% select(starts_with("kpa1_3320")) %>% descr()

tag <- c("kp1_3320","kpa2_3320")
lst <- lapply(tag, function(x) {za6838kum[grepl(x, colnames(za6838kum))] })
ext <- lapply(seq_along(lst), function(x) {
  str_extract(colnames(lst[[x]]), pattern = "(?<=_)\\w{5}") })
int <- intersect(ext[[1]], ext[[2]])
match_list <- lapply(lst, function(x) {
  select(x, matches(paste(int, collapse = "|"))) })
res <- mapply(function(x, y) { replace(x, is.na(x), y[is.na(x)]) }, 
              match_list[[1]], match_list[[2]])
za6838kum[,colnames(res)] <- res

za6838kum |> select(contains("3320a")) %>% frq


za6838kum = za6838kum %>%  mutate(kp1_3320a = coalesce(kp1_3320a, kpa2_3320a))
za6838kum = za6838kum %>%  mutate(kp1_3320b = coalesce(kp1_3320b, kpa2_3320b))
za6838kum = za6838kum %>%  mutate(kp1_3320c = coalesce(kp1_3320c, kpa2_3320c))
za6838kum = za6838kum %>%  mutate(kp1_3320d = coalesce(kp1_3320d, kpa2_3320d))
za6838kum = za6838kum %>%  mutate(kp1_3320e = coalesce(kp1_3320e, kpa2_3320e))
za6838kum = za6838kum %>%  mutate(kp1_3320f = coalesce(kp1_3320f, kpa2_3320f))
za6838kum = za6838kum %>%  mutate(kp1_3320h = coalesce(kp1_3320h, kpa2_3320h))
za6838kum = za6838kum %>%  mutate(kp1_3320i = coalesce(kp1_3320i, kpa2_3320i))
za6838kum = za6838kum %>%  mutate(kp1_3320j = coalesce(kp1_3320j, kpa2_3320j))
za6838kum = za6838kum %>%  mutate(kp1_3320k = coalesce(kp1_3320k, kpa2_3320k))
za6838kum = za6838kum %>%  mutate(kp1_3320l = coalesce(kp1_3320l, kpa2_3320l))
za6838kum = za6838kum %>%  mutate(kp1_3320m = coalesce(kp1_3320m, kpa2_3320m))
za6838kum = za6838kum %>%  mutate(kp1_3320n = coalesce(kp1_3320n, kpa2_3320n))
za6838kum = za6838kum %>%  mutate(kp1_3320o = coalesce(kp1_3320o, kpa2_3320o))
za6838kum = za6838kum %>%  mutate(kp1_3320p = coalesce(kp1_3320p, kpa2_3320p))
za6838kum = za6838kum %>%  mutate(kp1_3320q = coalesce(kp1_3320q, kpa2_3320q))
za6838kum = za6838kum %>%  mutate(kp1_3320s = coalesce(kp1_3320s, kpa2_3320s))
za6838kum = za6838kum %>%  mutate(kp1_3320t = coalesce(kp1_3320t, kpa2_3320t))
za6838kum = za6838kum %>%  mutate(kp1_3320u = coalesce(kp1_3320u, kpa2_3320u))
