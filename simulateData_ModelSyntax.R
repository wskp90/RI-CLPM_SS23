# install.packages("devtools") ####
devtools::install_github("jsakaluk/GCLM")
devtools::install_github('jflournoy/riclpmr')


GCMLT6 <- GCLM::gclm(xvar = "x", yvar = "y", waves = 6)
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

population.model <- ' f1 =~ x1 + 1.5*x2 + 1.2*x3 + x4 + 0.9*x5 + 0.7*x6
                      f2 =~ y1 + 1.5*y2 + 1.3*y3 + 1.1*y4 + 0.95*y5 + 0.8*y6
                      f1 ~ 0.4*f2
                      x3 ~ 2*y3
                    '

# generate data
set.seed(1234)
myData <- lavaan::simulateData(population.model, model.type = "sem",sample.nobs=500, orthogonal = F)
head(myData)

myData %>% psych::cor.plot(.,stars = T)
fake_data %>% psych::cor.plot(.,stars = T)



adf <- as.data.frame(MASS::mvrnorm(n=100, mu = rep(0, 30), Sigma = diag(30)))

xvars <- paste0('x', 1:10)
yvars <- paste0('y', 1:10)
mvars <- paste0('m', 1:10)

names(adf) <- c(xvars,yvars,mvars)

var_groups <- list(x = xvars, y = yvars, m = mvars)


model_text <- riclpm_text(var_groups = var_groups, constrain_over_waves = TRUE, constrain_ints = 'free')# NOT RUN {
summary(riclpmr:::lavriclpm(model_text, data = adf))
