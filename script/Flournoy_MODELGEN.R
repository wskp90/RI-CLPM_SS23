install.packages("riclpmr")
devtools::install_github('jflournoy/riclpmr')
library(riclpmr)
var_groups <- list(
  x=c("x1",  "x2",  "x3"),
  y=c("y1",  "y2",  "y3"))
model_text <- riclpmr::riclpm_text(var_groups, constrain_over_waves = F, constrain_ints = "free")
cat(model_text)


fake_data <- riclpmr::simriclpm(riclpmModel = model_text, sample.nobs = 500)
fit <- riclpmr::lavriclpm(riclpmModel = model_text, data = fake_data)
fit3 <- lavaan::sem(riclpmModel = model_text, data=fake_data, missing="ML", estimator = "MLR", mimic="Mplus", meanstructure = T)

lavaan::summary(fit)
lavaan::summary(fit2)
lavaan::summary(fit3)

Lx3 ~                                               
  Lx2     (sp06)    0.068    0.080    0.843    0.399
Ly2     (cl10)    0.017    0.070    0.247    0.805

'
lat_x1 =~ 1*x_t1
lat_x2 =~ 1*x_t2
lat_x3 =~ 1*x_t3
lat_y1 =~ 1*y_t1
lat_y2 =~ 1*y_t2
lat_y3 =~ 1*y_t3
lat_z1 =~ 1*z_t1
lat_z2 =~ 1*z_t2
lat_z3 =~ 1*z_t3

ri_x =~ 1*x_t1 + 1*x_t2 + 1*x_t3
ri_y =~ 1*y_t1 + 1*y_t2 + 1*y_t3
ri_z =~ 1*z_t1 + 1*z_t2 + 1*z_t3
x_t1 ~ x_t1_mu*1
x_t2 ~ x_t2_mu*1
x_t3 ~ x_t3_mu*1
y_t1 ~ y_t1_mu*1
y_t2 ~ y_t2_mu*1
y_t3 ~ y_t3_mu*1
z_t1 ~ z_t1_mu*1
z_t2 ~ z_t2_mu*1
z_t3 ~ z_t3_mu*1


ri_x ~~ ri_x
ri_y ~~ ri_y
ri_z ~~ ri_z
ri_x ~~ ri_y + ri_z
ri_y ~~ ri_z
lat_x1 ~~ lat_y1 + lat_z1
lat_x2 ~~ r_xy*lat_y2 + r_xz*lat_z2
lat_x3 ~~ r_xy*lat_y3 + r_xz*lat_z3
lat_y1 ~~ lat_z1
lat_y2 ~~ r_yz*lat_z2
lat_y3 ~~ r_yz*lat_z3
lat_x1 ~~ lat_x1
lat_x2 ~~ e_x*lat_x2
lat_x3 ~~ e_x*lat_x3
lat_y1 ~~ lat_y1
lat_y2 ~~ e_y*lat_y2
lat_y3 ~~ e_y*lat_y3
lat_z1 ~~ lat_z1
lat_z2 ~~ e_z*lat_z2
lat_z3 ~~ e_z*lat_z3


lat_x2 ~ x_x*lat_x1 + x_y*lat_y1 + x_z*lat_z1
lat_x3 ~ x_x*lat_x2 + x_y*lat_y2 + x_z*lat_z2
lat_y2 ~ y_x*lat_x1 + y_y*lat_y1 + y_z*lat_z1
lat_y3 ~ y_x*lat_x2 + y_y*lat_y2 + y_z*lat_z2
lat_z2 ~ z_x*lat_x1 + z_y*lat_y1 + z_z*lat_z1
lat_z3 ~ z_x*lat_x2 + z_y*lat_y2 + z_z*lat_z2
'