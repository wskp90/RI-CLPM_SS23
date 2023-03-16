# install.packages("devtools") ####
devtools::install_github("jsakaluk/GCLM")
devtools::install_github('jflournoy/riclpmr')


GCMLT5 <- GCLM::gclm(xvar = "x", yvar = "y", waves = 5)
var_groups3 <- list(
  x=c("x1",  "x2",  "x3", "x4", "x5", "x6"),
  y=c("y1",  "y2",  "y3", "y4", "y5", "y6"),
  z=c("z1",  "z2",  "z3", "z4", "z5", "z6"))
var_groups2 <- list(
  x=c("x1",  "x2",  "x3", "x4", "x5", "x6"),
  y=c("y1",  "y2",  "y3", "y4", "y5", "y6"))


RImodel3_t6 <- riclpmr::riclpm_text(var_groups3)
RImodel2_t6 <- riclpmr::riclpm_text(var_groups2, constrain_over_waves = F)
CLmodel2_t6 <- riclpmr::clpm(var_groups2, constrain = FALSE)

fake_data <- riclpmr::simriclpm(riclpmModel = model_text, sample.nobs = 5000)

cat(CLmodel2_t6)
cat(RImodel2_t6)

population.model <- ' F1 =~ x1 + 1.5*x2 + 1.2*x3 + x4 + 0.9*x5 + 0.7*x6
                      F2 =~ y1 + 1.4*y2 + 1.3*y3 + 1.1*y4 + 0.95*y5 + 0.8*y6
                      F1 ~ 0.3*F2
                      # x6 ~ 0.8*x5 + 0.6*x4 + 0.4*x3 + 0.2*x2 + 0.1*x1
                      # y6 ~ 0.8*y5 + 0.6*y4 + 0.4*y3 + 0.2*y2 + 0.1*y1
                      y6 ~ 0.3*x5
                      y5 ~ 0.3*x4
                      y4 ~ 0.3*x3
                      y3 ~ 0.3*x2
                      y2 ~ 0.3*x1'
myData <- lavaan::simulateData(population.model, model.type = "sem",sample.nobs=500, orthogonal = F,
                               int.ov.free = F,
                               int.lv.free = F,
                               auto.fix.first = F,
                               auto.fix.single = F,
                               auto.cov.lv.x = T,
                               auto.cov.y = T,
                               auto.var = T,
                               seed = 123)
myData %>% psych::cor.plot(.,stars = T)

sem.fit <- lavaan::sem(DF$clpm_L5C, data=myData, missing="ML", estimator = "MLR", mimic="Mplus", meanstructure = "default")
summary(sem.fit, fit.measures = TRUE)
sem.fit <- lavaan::sem(DF$riclpm5C, data=myData, missing="ML", estimator = "MLR", mimic="Mplus", meanstructure = "default")
summary(sem.fit, fit.measures = TRUE)


fake_data %>% psych::cor.plot(.,stars = T)



adf <- as.data.frame(MASS::mvrnorm(n=100, mu = rep(0, 30), Sigma = diag(30)))

xvars <- paste0('x', 1:10)
yvars <- paste0('y', 1:10)
mvars <- paste0('m', 1:10)

names(adf) <- c(xvars,yvars,mvars)

var_groups <- list(x = xvars, y = yvars, m = mvars)


model_text <- riclpm_text(var_groups = var_groups, constrain_over_waves = TRUE, constrain_ints = 'free')# NOT RUN {
summary(riclpmr:::lavriclpm(model_text, data = adf))


# Mplus in R code umwandeln ####

test = mplus2lavaan(here("zyphur/zyphur_m1.inp"))
mlpus_zyphur = 'MODEL:
! Unit Effects
Eta1_X by X6-X1;
Eta1_Y by Y6-Y1;

! Impulses
u_X6 by X6; X6@0; u_X5 by X5; X5@0; u_X4 by X4; X4@0; u_X3 by X3; 
X3@0; u_X2 by X2; X2@0; u_X1 by X1; X1@0; 
u_Y6 by Y6; Y6@0; u_Y5 by Y5; Y5@0; u_Y4 by Y4; Y4@0; u_Y3 by Y3; 
Y3@0; u_Y2 by Y2; Y2@0; u_Y1 by Y1; Y1@0; 

! AR Terms
X6-X3 PON X5-X2 (AR1_X);
X2 ON X1;
Y6-Y2 PON Y5-Y1 (AR1_Y);

! MA Terms
X6-X3 PON u_X5-u_X2 (MA1_X);
X6-X3 PON u_X4-u_X1 (MA2_X);
Y6-Y2 PON u_Y5-u_Y1 (MA1_Y);

! CL Terms
X6-X3 PON Y5-Y2 (CL1_XY);
X2 ON Y1; 
Y6-Y2 PON X5-X1 (CL1_YX);

! CLMA Terms
X6-X3 PON u_Y5-u_Y2 (CLMA1_XY); 
Y6-Y2 PON u_X5-u_X1 (CLMA1_YX);

! Restrictions
u_X6-u_X1 WITH Eta1_X@0 Eta1_Y@0;
u_Y6-u_Y1 WITH Eta1_X@0 Eta1_Y@0;
u_X6-u_X1 WITH u_X6-u_X1@0; 
u_Y6-u_Y1 WITH u_Y6-u_Y1@0;
u_X6-u_X1 WITH u_Y6-u_Y1@0;

! Co-Movements
u_X6 WITH u_Y6;
u_X5 WITH u_Y5;
u_X4 WITH u_Y4;
u_X3 WITH u_Y3;
u_X2 WITH u_Y2;
u_X1 WITH u_Y1;

! Impulse Responses-users must fill in intervening occasions for each ellipses
MODEL INDIRECT: 
X6 IND u_X2; X5 IND u_X2; X4 IND u_X2; X3 IND u_X2;
X6 IND u_Y2; X5 IND u_Y2; X4 IND u_Y2; X3 IND u_Y2; 
Y6 IND u_X2; Y5 IND u_X2; Y4 IND u_X2; Y3 IND u_X2; 
Y6 IND u_Y2; Y5 IND u_Y2; Y4 IND u_Y2; Y3 IND u_Y2; 

! Total AR, MA, AR+MA, CL, CLMA, and CL+CLMA effects
MODEL CONSTRAINT: 
New (AR_X MA_X ARMA_X CL_XY CLMA_XY CLCL_XY );
New (AR_Y MA_Y ARMA_Y CL_YX CLMA_YX CLCL_YX );

AR_X=AR1_X; MA_X=MA1_X+MA2_X; ARMA_X=AR1_X+MA1_X+MA2_X; 
CL_XY=CL1_XY; CLMA_XY=CLMA1_XY; CLCL_XY=CL1_XY+CLMA1_XY; 
AR_Y=AR1_Y; MA_Y=MA1_Y; ARMA_Y=AR1_Y+MA1_Y; CL_YX=CL1_YX; 
CLMA_YX=CLMA1_YX; CLCL_YX=CL1_YX+CLMA1_YX;

OUTPUT: STDYX;'
test = mplus2lavaan.modelSyntax(mlpus_zyphur)
cat(test)
