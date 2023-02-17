rm(list= ls()) # start clean ####
if (!require("pacman")) install.packages("pacman")
pacman::p_load(sjlabelled,foreign,
               psych,lm.beta, GPArotation,flextable,semTools,semPlot,lavaan,tidyverse,sjmisc,TAM,Hmisc,here,broom,questionr,codebook,DataExplorer,tidySEM,fs,usethis,labelled,magrittr,janitor)
load(paste0(Sys.getenv("FAUBOX"),"/GLES/za6838/za6838_w1-w15.Rda"))
za6838kum %<>% mutate(across(contains(c("_3320","_2180","_040","_5000","_050","3103","_060","_5010","_160","_2200","_1555","_1570")), ~rec(., rec = "-99,-95,-93=NA; else = copy")))
za6838kum %<>% mutate(across(contains(c("_4043","_4044","_4045","_4046")), ~rec(., rec = "-99,-95,-93=NA; else = copy")))

za6838kum %<>% mutate(across(contains(c("_430a","_430b","_430c","_430d","_430e","_430f","_430i")), ~rec(., rec = "-99:-71=NA; else = copy")))

za6838kum %>% select(contains("_430i")) %>% frq()

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


# Schwartz ####
za6838kum |> select(contains("3320a")) %>% frq
za6838kum = johnny(za6838kum,"kp1_3320","kpa1_3320")
za6838kum = johnny(za6838kum,"kp1_3320","kpa2_3320")
za6838kum |> select(contains("430i")) %>% frq

schwartz = list() # Liste für Schwartzwerte

schwartz$w1_achi = c("kp1_3320d","kp1_3320l")
schwartz$w1_bene = c("kp1_3320k","kp1_3320p")
schwartz$w1_conf = c("kp1_3320n","kp1_3320q")
schwartz$w1_hedo = c("kp1_3320g","kp1_3320r")
schwartz$w1_powr = c("kp1_3320b","kp1_3320o")
schwartz$w1_secu = c("kp1_3320e","kp1_3320m")
schwartz$w1_sedi = c("kp1_3320a","kp1_3320i")
schwartz$w1_stim = c("kp1_3320f","kp1_3320s")
schwartz$w1_trad = c("kp1_3320j","kp1_3320t")
schwartz$w1_univ = c("kp1_3320c","kp1_3320h","kp1_3320m")


za6838kum %>% select(schwartz$w1_achi) %>% psych::alpha(check.keys = T) %>% summary()
za6838kum %>% select(schwartz$w1_bene) %>% psych::alpha(check.keys = T) %>% summary()
za6838kum %>% select(schwartz$w1_conf) %>% psych::alpha(check.keys = T) %>% summary()
za6838kum %>% select(schwartz$w1_hedo) %>% psych::alpha(check.keys = T) %>% summary()
za6838kum %>% select(schwartz$w1_powr) %>% psych::alpha(check.keys = T) %>% summary()
za6838kum %>% select(schwartz$w1_secu) %>% psych::alpha(check.keys = T) %>% summary()
za6838kum %>% select(schwartz$w1_sedi) %>% psych::alpha(check.keys = T) %>% summary()
za6838kum %>% select(schwartz$w1_stim) %>% psych::alpha(check.keys = T) %>% summary()
za6838kum %>% select(schwartz$w1_trad) %>% psych::alpha(check.keys = T) %>% summary()
za6838kum %>% select(schwartz$w1_univ) %>% psych::alpha(check.keys = T) %>% summary()

za6838kum = za6838kum %>% row_sums(across(schwartz$w1_achi), n=2 , var = "w1_achi")
za6838kum = za6838kum %>% row_sums(across(schwartz$w1_bene), n=2 , var = "w1_bene")
za6838kum = za6838kum %>% row_sums(across(schwartz$w1_conf), n=2 , var = "w1_conf")
za6838kum = za6838kum %>% row_sums(across(schwartz$w1_hedo), n=2 , var = "w1_hedo")
za6838kum = za6838kum %>% row_sums(across(schwartz$w1_powr), n=2 , var = "w1_powr")
za6838kum = za6838kum %>% row_sums(across(schwartz$w1_secu), n=2 , var = "w1_secu")
za6838kum = za6838kum %>% row_sums(across(schwartz$w1_sedi), n=2 , var = "w1_sedi")
za6838kum = za6838kum %>% row_sums(across(schwartz$w1_stim), n=2 , var = "w1_stim")
za6838kum = za6838kum %>% row_sums(across(schwartz$w1_trad), n=2 , var = "w1_trad")
za6838kum = za6838kum %>% row_sums(across(schwartz$w1_univ), n=3 , var = "w1_univ")

za6838kum %>% select(c(starts_with("kp15_4045"),starts_with("kp1_430"),starts_with("w1_"))) %>%
  corPlot(zlim = c(-1,1), diag = F, stars = T, upper = F, cex.axis = 0.8, xlas=3, show.legend=FALSE)

schwartz$w1_all_items = za6838kum %>% dplyr::select(starts_with("kp1_3320"))
## Korrelationsmatrix für EFA
schwartz$w1.correl = corr.test(schwartz$w1_all_items, use = "pairwise.complete.obs")
## correlation adequacy Bartlett's test
cortest.bartlett(schwartz$w1.correl$r, n = min(schwartz$w1.correl$n), diag = T)
## sampling adequacy KMO test
KMO(schwartz$w1.correl$r)
## how many factors?
schwartz$w1.nofactors = fa.parallel(schwartz$w1_all_items, fm="ml", fa="fa")
sum(schwartz$w1.nofactors$fa.values > 1.0) ##old kaiser criterion
sum(schwartz$w1.nofactors$fa.values > .7) ##new kaiser criterion
semTools::efa.ekc(schwartz$w1_all_items, missing = "ml")

schwartz$w1.fa = fa(schwartz$w1_all_items, nfactors = 3, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
1 - ((schwartz$w1.fa$STATISTIC-schwartz$w1.fa$dof)/
       (schwartz$w1.fa$null.chisq-schwartz$w1.fa$null.dof)) # CFI errechnen
fa.sort(schwartz$w1.fa)
fa.organize(schwartz$w1.fa)

schwartz$fs <- factor.scores(schwartz$w1_all_items,schwartz$w1.fa)
fs = schwartz$fs$scores

za6838kum = cbind(za6838kum,fs)

kp15_covid = za6838kum %>% select(c(starts_with("kp1_3320"),starts_with("kp15_4045"),starts_with("ML")))


za6838kum %>% select(c(starts_with("kp15_4045"),starts_with("ML"))) %>%
  corPlot(zlim = c(-1,1), diag = F, stars = T, upper = F, cex.axis = 0.8, xlas=3, show.legend=FALSE)
za6838kum |> select(contains("4045a")) %>% frq



# Big 5 ####
za6838kum |> select(contains("2180a")) %>% frq
za6838kum = johnny(za6838kum,"kp1_2180","kpa1_2180")
za6838kum = johnny(za6838kum,"kp1_2180","kpa2_2180")
za6838kum |> select(contains("kp1_2180")) %>% frq


big5 = list() # Liste für big5werte

big5$revlist = c("kp1_2180a","kp1_2180d","kp1_2180j","kp1_2180k","kp1_2180h","kp1_2180m","kp1_2180o")

za6838kum %<>% mutate(across(all_of(big5$revlist), ~rec(., rec = "rev"))) # Richtung umdrehen

big5$w1_extr = c("kp1_2180a","kp1_2180b","kp1_2180c")
big5$w1_gewi = c("kp1_2180d","kp1_2180e","kp1_2180f")
big5$w1_neur = c("kp1_2180j","kp1_2180k","kp1_2180l")
big5$w1_offn = c("kp1_2180g","kp1_2180h","kp1_2180i")
big5$w1_vert = c("kp1_2180m","kp1_2180n","kp1_2180o")

za6838kum %>% select(big5$w1_extr) %>% psych::alpha(check.keys = T)
za6838kum %>% select(big5$w1_gewi) %>% psych::alpha(check.keys = T)
za6838kum %>% select(big5$w1_neur) %>% psych::alpha(check.keys = T)
za6838kum %>% select(big5$w1_offn) %>% psych::alpha(check.keys = T)
za6838kum %>% select(big5$w1_vert) %>% psych::alpha(check.keys = T)

za6838kum %<>% row_sums(all_of(big5$w1_extr), n=3 , var = "b5_extr")
za6838kum %<>% row_sums(all_of(big5$w1_gewi), n=3 , var = "b5_gewi")
za6838kum %<>% row_sums(all_of(big5$w1_neur), n=3 , var = "b5_neur")
za6838kum %<>% row_sums(all_of(big5$w1_offn), n=3 , var = "b5_offn")
za6838kum %<>% row_sums(all_of(big5$w1_vert), n=3 , var = "b5_vert")


za6838kum %>% select(c(starts_with("w1_"),starts_with("b5_"))) %>%
  corPlot(zlim = c(-1,1), diag = F, stars = T, upper = F, cex.axis = 0.8, xlas=3, show.legend=FALSE)



big5$w1_all_items = za6838kum %>% dplyr::select(starts_with("kp1_2180"))
## Korrelationsmatrix für EFA
big5$w1.correl = corr.test(big5$w1_all_items, use = "pairwise.complete.obs")
## correlation adequacy Bartlett's test
cortest.bartlett(big5$w1.correl$r, n = min(big5$w1.correl$n), diag = T)
## sampling adequacy KMO test
KMO(big5$w1.correl$r)
## how many factors?
big5$w1.nofactors = fa.parallel(big5$w1_all_items, fm="ml", fa="fa")
sum(big5$w1.nofactors$fa.values > 1.0) ##old kaiser criterion
sum(big5$w1.nofactors$fa.values > .7) ##new kaiser criterion
semTools::efa.ekc(big5$w1_all_items, missing = "ml")

big5$w1.fa = fa(big5$w1_all_items, nfactors = 5, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
1 - ((big5$w1.fa$STATISTIC-big5$w1.fa$dof)/
       (big5$w1.fa$null.chisq-big5$w1.fa$null.dof)) # CFI errechnen
fa.sort(big5$w1.fa)
fa.organize(big5$w1.fa)

big5$fs <- factor.scores(big5$w1_all_items,big5$w1.fa)
fs = big5$fs$scores

za6838kum = cbind(za6838kum,fs)

kp15_covid = za6838kum %>% select(c(starts_with("kp1_2180"),starts_with("kp15_4045"),starts_with("ML")))


za6838kum %>% select(c(starts_with("kp1_2180"),starts_with("kp1_3320"))) %>%
  corPlot(zlim = c(-1,1), diag = F, stars = T, upper = F, cex.axis = 0.8, xlas=3, show.legend=FALSE)
za6838kum |> select(contains("4045a")) %>% frq

za6838kum = za6838kum %>% rename(w1_b5_f1 = ML1, w1_b5_f2 = ML2, w1_b5_f3 = ML3, w1_b5_f4 = ML4, w1_b5_f5 = ML5)

za6838kum %>% select(c(starts_with("w1_b5"),contains("_430i"))) %>%
  corPlot(zlim = c(-1,1), diag = F, stars = T, upper = F, cex.axis = 0.8, xlas=3, show.legend=FALSE)




# Big 5 & Schwartz ####

b_schw = list() # Liste für big5werte

b_schw$w1_all_items = za6838kum %>% dplyr::select(c(starts_with("kp1_2180"),starts_with("kp1_3320")))
## Korrelationsmatrix für EFA
b_schw$w1.correl = corr.test(b_schw$w1_all_items, use = "pairwise.complete.obs")
## correlation adequacy Bartlett's test
cortest.bartlett(b_schw$w1.correl$r, n = min(b_schw$w1.correl$n), diag = T)
## sampling adequacy KMO test
KMO(b_schw$w1.correl$r)
## how many factors?
b_schw$w1.nofactors = fa.parallel(b_schw$w1_all_items, fm="ml", fa="fa")
sum(b_schw$w1.nofactors$fa.values > 1.0) ##old kaiser criterion
sum(b_schw$w1.nofactors$fa.values > .7) ##new kaiser criterion
semTools::efa.ekc(b_schw$w1_all_items, missing = "ml")

b_schw$w1.fa = fa(b_schw$w1_all_items, nfactors = 5, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
1 - ((b_schw$w1.fa$STATISTIC-b_schw$w1.fa$dof)/
       (b_schw$w1.fa$null.chisq-b_schw$w1.fa$null.dof)) # CFI errechnen
fa.sort(b_schw$w1.fa)
fa.organize(b_schw$w1.fa)

b_schw$fs <- factor.scores(b_schw$w1_all_items,b_schw$w1.fa)
fs = b_schw$fs$scores

za6838kum = cbind(za6838kum,fs)
