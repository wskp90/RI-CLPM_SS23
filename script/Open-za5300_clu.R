rm(list= ls()) # start clean ####
if (!require("pacman")) install.packages("pacman")
pacman::p_load(sjlabelled,foreign,
  psych,lm.beta, GPArotation,flextable,semTools,semPlot,lavaan,tidyverse,sjmisc,TAM,Hmisc,here,broom,questionr,codebook,DataExplorer,tidySEM,fs,usethis,cluster)
za5300 = read_spss(paste0(Sys.getenv("FAUBOX"),"/GLES/za5300/ZA5300_de_v5-0-2.sav"),drop.labels = T)



clu_5300 = za5300  %>%  select("q2","q63","q64")

clu_5300 = clu_5300 %>% na.omit()

save(za6804, file = "daten/za6804.Rda")
rm(list= ls()) # start clean ####
load(here("daten/za6804.Rda"))

za6804 %>% select(starts_with("kp9_060")) %>% frq()
za6804 = za6804 %>% select(-kp1_5000flag)
delete.na <- function(DF, n=0) {
  DF[rowSums(is.na(DF)) <= n,]
}
za6804 = delete.na(za6804,105)
# codebook_browser(za6804)



za6804 %>% select(starts_with("kp1_3320")) %>%  psych::alpha(check.keys = T) %>% summary()
za6804 %>% select(starts_with("kp1_2180")) %>%  psych::alpha(check.keys = T) %>% summary()
# za6804 %>% select(starts_with("kp1_1572")) %>%  psych::alpha(check.keys = T) %>% summary()
# za6804 %>% select(starts_with("kp1_020")) %>%  psych::alpha(check.keys = T) %>% summary()
za6804 %>% select(starts_with("kp1_040")) %>%  psych::alpha(check.keys = T) %>% summary()
za6804 %>% select(starts_with("kp1_5000")) %>%  psych::alpha(check.keys = T) %>% summary()
za6804 %>% select(starts_with("kp9_050")) %>%  psych::alpha(check.keys = T) %>% summary()
za6804 %>% select(starts_with("kp9_3103")) %>%  psych::alpha(check.keys = T) %>% summary()
za6804 %>% select(starts_with("kp9_060")) %>%  psych::alpha(check.keys = T) %>% summary()
za6804 %>% select(starts_with("kp9_5010")) %>%  psych::alpha(check.keys = T) %>% summary()
za6804 %>% select(starts_with("kp9_160")) %>%  psych::alpha(check.keys = T) %>% summary()
za6804 %>% select(starts_with("kp9_2200")) %>%  psych::alpha(check.keys = T) %>% summary()
za6804 %>% select(starts_with("kp6_1555")) %>%  psych::alpha(check.keys = T) %>% summary()
za6804 %>% select(starts_with("kp3_1570")) %>%  psych::alpha(check.keys = T)




za6804 = za6804 %>% mutate(risk = kp1_1572)
za6804 = za6804 %>% mutate(demsat = kp1_020)

za6804 %>% select("kp1_1572","risk") %>% frq()
za6804 %>% select("kp1_020","demsat") %>% frq()



fa_tmp = za6804 %>% select(starts_with("kp1_3320")) %>% fa(nfactors = 1, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
za6804 = cbind(za6804,fa_tmp$scores)
za6804 = za6804 %>% rename(fa_schwartz = ML1)
za6804 %>% descr(fa_schwartz)
fa_tmp = za6804 %>% select(starts_with("kp1_2180")) %>% fa(nfactors = 1, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
za6804 = cbind(za6804,fa_tmp$scores)
za6804 = za6804 %>% rename(fa_big5 = ML1)
za6804 %>% descr(fa_big5)
# fa_tmp = za6804 %>% select(starts_with("kp1_1572")) %>% fa(nfactors = 1, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
# za6804 = cbind(za6804,fa_tmp$scores)
# za6804 = za6804 %>% rename(fa_risk = ML1)
# za6804 %>% descr(fa_risk)
# fa_tmp = za6804 %>% select(starts_with("kp1_020")) %>% fa(nfactors = 1, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
# za6804 = cbind(za6804,fa_tmp$scores)
# za6804 = za6804 %>% rename(fa_demsat = ML1)
# za6804 %>% descr(fa_demsat)
fa_tmp = za6804 %>% select(starts_with("kp1_040")) %>% fa(nfactors = 1, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
za6804 = cbind(za6804,fa_tmp$scores)
za6804 = za6804 %>% rename(fa_anopol = ML1)
za6804 %>% descr(fa_anopol)
fa_tmp = za6804 %>% select(starts_with("kp1_5000")) %>% fa(nfactors = 1, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
za6804 = cbind(za6804,fa_tmp$scores)
za6804 = za6804 %>% rename(fa_natind = ML1)
za6804 %>% descr(fa_natind)
fa_tmp = za6804 %>% select(starts_with("kp9_050")) %>% fa(nfactors = 1, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
za6804 = cbind(za6804,fa_tmp$scores)
za6804 = za6804 %>% rename(fa_demprin = ML1)
za6804 %>% descr(fa_demprin)
fa_tmp = za6804 %>% select(starts_with("kp9_3103")) %>% fa(nfactors = 1, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
za6804 = cbind(za6804,fa_tmp$scores)
za6804 = za6804 %>% rename(fa_popu = ML1)
za6804 %>% descr(fa_popu)
fa_tmp = za6804 %>% select(starts_with("kp9_060")) %>% fa(nfactors = 1, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
za6804 = cbind(za6804,fa_tmp$scores)
za6804 = za6804 %>% rename(fa_auto = ML1)
za6804 %>% descr(fa_auto)
fa_tmp = za6804 %>% select(starts_with("kp9_5010")) %>% fa(nfactors = 1, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
za6804 = cbind(za6804,fa_tmp$scores)
za6804 = za6804 %>% rename(fa_artind = ML1)
za6804 %>% descr(fa_artind)
fa_tmp = za6804 %>% select(starts_with("kp9_160")) %>% fa(nfactors = 1, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
za6804 = cbind(za6804,fa_tmp$scores)
za6804 = za6804 %>% rename(fa_trust = ML1)
za6804 %>% descr(fa_trust)
fa_tmp = za6804 %>% select(starts_with("kp9_2200")) %>% fa(nfactors = 1, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
za6804 = cbind(za6804,fa_tmp$scores)
za6804 = za6804 %>% rename(fa_verbun = ML1)
za6804 %>% descr(fa_verbun)
fa_tmp = za6804 %>% select(starts_with("kp6_1555")) %>% fa(nfactors = 1, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
za6804 = cbind(za6804,fa_tmp$scores)
za6804 = za6804 %>% rename(fa_polmot = ML1)
za6804 %>% descr(fa_polmot)
fa_tmp = za6804 %>% select(starts_with("kp3_1570")) %>% fa(nfactors = 1, fm = "ml", rotate = "oblimin", scores = "regression", use = "pairwise.complete.obs")
za6804 = cbind(za6804,fa_tmp$scores)
za6804 = za6804 %>% rename(fa_ncog = ML1)
za6804 %>% descr(fa_ncog)

za6804$ncog = za6804 %>% select(starts_with("kp3_1570")) %>% rowSums(.,na.rm = F) %>% as.numeric


za6804 %>% select(starts_with("fa_"),"ncog","risk","demsat") %>% corr.test(use = "pairwise.complete.obs")
za6804 %>% select(starts_with("fa_"),"risk","demsat") %>% corPlot(zlim = c(-1,1), diag = F, stars = T, upper = F, cex.axis = 0.8, xlas=3, show.legend=FALSE)

devtools::install_github("cjvanlissa/tidySEM")


test01 = za6804 %>% select(starts_with("kp1_3320")) %>% tidy_sem()

za6804 %>% select(starts_with("kp1_3320")) %>% plot_correlation(cor_args = list("use" = "pairwise.complete.obs"))

test02 = za6804 %>% select(starts_with("kp1_2180")) %>% tidy_sem()

cscale_01 = create_scales(test01)
cscale_02 = create_scales(test02, missing = "listwise")

za6804 = cbind(za6804,cscale_02$scores)

za6804 %>% select("fa_big5","kp1") %>% corr.test(use = "pairwise.complete.obs")


# FS Paket (Erweiterung des Here pakets)
# from external directory
faubox_dir <- path_home("FAUbox/data_void/bayupf-scoping_review")
load(path(faubox_dir, "/tpm/tpm.Rds"))
