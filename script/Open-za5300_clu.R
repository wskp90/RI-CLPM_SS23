rm(list= ls()) # start clean ####
if (!require("pacman")) install.packages("pacman")
pacman::p_load(sjlabelled,foreign,
  psych,tidyverse,sjmisc,Hmisc,here,broom,usethis,cluster,factoextra,philentropy)
# za5300 = read_spss(paste0(Sys.getenv("FAUBOX"),"/GLES/za5300/ZA5300_de_v5-0-2.sav"),drop.labels = T)
za5301 = read_stata(paste0(Sys.getenv("FAUBOX"),"/GLES/za5300/ZA5300_clu.dta"),drop.labels = T)


# clu_5300 = za5300  %>%  select("vw_lfdn","q2","q63","q64") %>% mutate(across(c(q2, q63, q64), as.numeric))
clu_5301 = za5301  %>%  select("vw_lfdn","q2","q63","q64") %>% mutate(across(c(q2, q63, q64), as.numeric))

# clu_5300 <- clu_5300 %>% column_to_rownames(var = "vw_lfdn")
clu_5301 <- clu_5301 %>% column_to_rownames(var = "vw_lfdn")
# clu_5300 = clu_5300 %>% na.omit()
clu_5301 = clu_5301 %>% na.omit()

# clu_5300 = clu_5300 %>% mutate(across(c("q2","q63","q64"), scale))

# clu_d1 = daisy(clu_5300, metric = "euclidean", stand = T)
clu_d11 = daisy(clu_5301, metric = "euclidean", stand = T)
clu_5301 = clu_5301 %>% mutate(across(c("q2","q63","q64"), scale))
clu_d2 = philentropy::distance(clu_5301, method = "squared_euclidean") %>% as.dist()

# hc2 <- agnes(clu_5300, metric = "euclidean",method = "ward", stand = F)
# hc3 =  hclust(clu_d1, method="ward.D2")
hc31 =  hclust(clu_d11, method="ward.D2")
hc32 =  hclust(clu_d2, method="ward.D2")
hc33 =  hclust(clu_d2, method="ward.D")
hc34 =  agnes(clu_d2, method="ward")
# sub_grp <- cutree(hc3, k = 6)
sub_grp1 <- cutree(hc31, k = 6)
sub_grp2 <- cutree(hc32, k = 6)
sub_grp3 <- cutree(hc33, k = 6)
sub_grp4 <- cutree(hc33, k = 6)
# table(sub_grp)
table(sub_grp1)
table(sub_grp2)
table(sub_grp3)
table(sub_grp4)
# clu_5300 = cbind(clu_5300,sub_grp)
clu_5301 = cbind(clu_5301,sub_grp1,sub_grp2,sub_grp3)

# clu_5300 = clu_5300 %>% rownames_to_column(var = "vw_lfdn") 
clu_5301 = clu_5301 %>% rownames_to_column(var = "vw_lfdn") 
# clu_5300 = clu_5300 %>% as_data_frame() %>% mutate(across(vw_lfdn, as.numeric))
clu_5301 = clu_5301 %>% as_data_frame() %>% mutate(across(vw_lfdn, as.numeric))


# clu_comp = za5300 %>% select("vw_lfdn","q2","q63","q64","CLU6_1","CLU6_2","QCL_1")
clu_comp1 = za5301 %>% select("vw_lfdn","q2","q63","q64","CLU6_1","CLU6_2","QCL_1","z_clu")
# clu_comp = full_join(clu_comp,clu_5300, by = "vw_lfdn")
clu_comp1 = full_join(clu_comp1,clu_5301, by = "vw_lfdn")


# clu_comp1 %>% group_by(sub_grp1,CLU6_2) %>% tally() %>% spread(CLU6_2, n)
# clu_comp1 %>% group_by(sub_grp1,z_clu) %>% tally() %>% spread(z_clu, n)

# st_spss = table(clu_comp1$CLU6_2 , clu_comp1$sub_grp2)

clu_comp1 %>% select(c("sub_grp3","sub_grp2","sub_grp1","CLU6_1","CLU6_2","QCL_1","z_clu")) %>% corr.test(use = "pairwise.complete.obs", method = "spearman")


pltree(hc2, cex = 0.6, hang = -1, main = "Dendrogram of agnes") 

fviz_nbclust(clu_5300, FUN = hcut, method = "silhouette")

