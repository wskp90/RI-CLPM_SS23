rm(list= ls()) # start clean ####
if (!require("pacman")) install.packages("pacman")
pacman::p_load(sjlabelled,foreign,
  psych,tidyverse,sjmisc,Hmisc,here,broom,usethis,cluster,factoextra)
za5300 = read_spss(paste0(Sys.getenv("FAUBOX"),"/GLES/za5300/ZA5300_de_v5-0-2.sav"),drop.labels = T)
# za5301 = read_stata(paste0(Sys.getenv("FAUBOX"),"/GLES/za5300/ZA5300_clu.dta"),drop.labels = T)


clu_5300 = za5300  %>%  select("vw_lfdn","q2","q63","q64","CLU6_2") %>% mutate(across(c(q2, q63, q64), as.numeric)) %>% 
  column_to_rownames(var = "vw_lfdn") %>% 
  na.omit()


# clu_d1 = clu_5301 %>% mutate(across(c("q2","q63","q64"), scale)) %>% daisy(., metric = "euclidean", stand = T) #Akward results
# clu_d2 = clu_5300 %>% mutate(across(c("q2","q63","q64"), scale)) %>% dist(.,method = "euclidean") %>% as.dist()
# clu_d3 = clu_5301 %>% mutate(across(c("q2","q63","q64"), scale)) %>% philentropy::distance(., method = "squared_euclidean") %>% as.dist()



# hc2 <- agnes(clu_5300, metric = "euclidean",method = "ward", stand = F)
# hc3 =  hclust(clu_d1, method="ward.D2")
# hc31 = hclust(clu_d2, method="ward.D2")
# hc32 = eclust(clu_5301, "hclust", k = 6, stand=T, hc_metric = "euclidean", hc_method = "ward.D2")
# hc33 = hclust(clu_d3, method="ward.D")
hc34 = clu_5300 %>% select("q2","q63","q64") %>% 
  hcut(., k = 4, stand=T, hc_func = "hclust", hc_method = "ward.D2", hc_metric = "euclidean")
# fviz_cluster(hc32)
fviz_cluster(hc34)
fviz_silhouette(hc34)
# sub_grp <- cutree(hc3, k = 6)
# sub_grp1 <- cutree(hc31, k = 6)
# sub_grp2 <- cutree(hc32, k = 6)
# sub_grp3 <- cutree(hc33, k = 6)
sub_grp4 <- cutree(hc34, k = 6)

# table(sub_grp)
# table(sub_grp1)
# table(sub_grp2)
# table(sub_grp3)
table(sub_grp4)
# clu_5300 = cbind(clu_5300,sub_grp)
clu_5300 = cbind(clu_5300,sub_grp4)

# clu_5300 = clu_5300 %>% rownames_to_column(var = "vw_lfdn") 
clu_5300 = clu_5300 %>% rownames_to_column(var = "vw_lfdn") %>% as.data.frame() %>% mutate(across(vw_lfdn, as.numeric))

# clu_5300 = clu_5300 %>% as_data_frame() %>% mutate(across(vw_lfdn, as.numeric))

# clu_comp = za5300 %>% select("vw_lfdn","q2","q63","q64","CLU6_1","CLU6_2","QCL_1")
clu_comp1 = za5300 %>% select("vw_lfdn","q2","q63","q64","CLU6_2")
# clu_comp = full_join(clu_comp,clu_5300, by = "vw_lfdn")
clu_comp1 = full_join(clu_comp1,clu_5300, by = "vw_lfdn")


# clu_comp1 %>% group_by(sub_grp1,CLU6_2) %>% tally() %>% spread(CLU6_2, n)
# clu_comp1 %>% group_by(sub_grp1,z_clu) %>% tally() %>% spread(z_clu, n)

table(clu_5300$sub_grp4 , clu_5300$CLU6_2) %>% rcompanion::cramerV()




clu_comp1 %>% select(c("sub_grp4","sub_grp3","sub_grp2","sub_grp1","CLU6_1","CLU6_2","QCL_1","z_clu")) %>% corr.test(use = "pairwise.complete.obs", method = "spearman")



# clu_long = gather(clu_5301, clu_item, clu_val, q2:q64, factor_key = T)
clu_5300 %>% group_by(sub_grp4) %>% 
  summarise(m2 = mean(q2), m63 = mean(q63), m64 = mean(q64)) %>% 
  ggplot(aes(x=sub_grp4)) + 
           geom_line(aes(y = m2, color = "PolInt")) +
           geom_line(aes(y = m63/2.2, color = "SozÖk")) +
           geom_line(aes(y = m64/2.2, color = "Liberal")) +
    scale_y_continuous(sec.axis = sec_axis(~.*2.2, name=c("Orientierung")))
  
  



pltree(hc2, cex = 0.6, hang = -1, main = "Dendrogram of agnes") 

fviz_nbclust(clu_5300, FUN = hcut, method = "silhouette")

