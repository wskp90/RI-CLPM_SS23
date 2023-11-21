
# 3 Waves ####
## mean latent intercept and constrained residual variances ####
DF$modef$gm$m3y1 <-'
# intercept
i =~ 1*y1 + 1*y2 + 1*y3
i~~0*i
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
'
## mean latent intercept that is allowed to vary, and constrained residual variances ####
DF$modef$gm$m3y2 <-'
# intercept
i =~ 1*y1 + 1*y2 + 1*y3
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
'
## mean latent intercept that is allowed to vary, mean latent slope, and constrained residual variances ####
DF$modef$gm$m3y3 <- '
# intercept
i =~ 1*y1 + 1*y2 + 1*y3
# slope
s =~ 0*y1 + 1*y2 + 2*y3
s~0*1
s~~0*i
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
'
## mean latent intercept that is allowed to vary, mean latent slope that is allowed to vary, and constrained residual variances ####
DF$modef$gm$m3y4 <- '
# intercept
i =~ 1*y1 + 1*y2 + 1*y3
# slope
s =~ 0*y1 + 1*y2 + 2*y3
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
'
## unconstrained model ####
DF$modef$gm$m3y5 <-'
# intercept
i =~ 1*y1 + 1*y2 + 1*y3
# slope
s =~ 0*y1 + 1*y2 + 2*y3
'

# 4 Waves ####
## mean latent intercept and constrained residual variances ####
DF$modef$gm$m4y1 <-'
# intercept
i =~ 1*y1 + 1*y2 + 1*y3 + 1*y4
i~~0*i
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
y4~~r*y4
'
## mean latent intercept that is allowed to vary, and constrained residual variances ####
DF$modef$gm$m4y2 <-'
# intercept
i =~ 1*y1 + 1*y2 + 1*y3 + 1*y4
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
y4~~r*y4
'
## mean latent intercept that is allowed to vary, mean latent slope, and constrained residual variances ####
DF$modef$gm$m4y3 <- '
# intercept
i =~ 1*y1 + 1*y2 + 1*y3 + 1*y4
# slope
s =~ 0*y1 + 1*y2 + 2*y3 + 3*y4
s~0*1
s~~0*i
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
y4~~r*y4
'
## mean latent intercept that is allowed to vary, mean latent slope that is allowed to vary, and constrained residual variances ####
DF$modef$gm$m4y4 <- '
# intercept
i =~ 1*y1 + 1*y2 + 1*y3 + 1*y4
# slope
s =~ 0*y1 + 1*y2 + 2*y3 + 3*y4
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
y4~~r*y4
'
## unconstrained model ####
DF$modef$gm$m4y5 <-'
# intercept
i =~ 1*y1 + 1*y2 + 1*y3 + 1*y4
# slope
s =~ 0*y1 + 1*y2 + 2*y3 + 3*y4
'
# 5 Waves ####
## mean latent intercept and constrained residual variances ####
DF$modef$gm$m5y1 <-'
# intercept
i =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5
i~~0*i
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
y4~~r*y4
y5~~r*y5
'
## mean latent intercept that is allowed to vary, and constrained residual variances ####
DF$modef$gm$m5y2 <-'
# intercept
i =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
y4~~r*y4
y5~~r*y5
'
## mean latent intercept that is allowed to vary, mean latent slope, and constrained residual variances ####
DF$modef$gm$m5y3 <- '
# intercept
i =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5
# slope
s =~ 0*y1 + 1*y2 + 2*y3 + 3*y4 + 4*y5
s~0*1
s~~0*i
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
y4~~r*y4
y5~~r*y5
'
## mean latent intercept that is allowed to vary, mean latent slope that is allowed to vary, and constrained residual variances ####
DF$modef$gm$m5y4 <- '
# intercept
i =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5
# slope
s =~ 0*y1 + 1*y2 + 2*y3 + 3*y4 + 4*y5
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
y4~~r*y4
y5~~r*y5
'
## unconstrained model ####
DF$modef$gm$m5y5 <-'
# intercept
i =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5
# slope
s =~ 0*y1 + 1*y2 + 2*y3 + 3*y4 + 4*y5
'
# 6 Waves ####
## mean latent intercept and constrained residual variances ####
DF$modef$gm$m6y1 <-'
# intercept
i =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5 + 1*y6
i~~0*i
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
y4~~r*y4
y5~~r*y5
y6~~r*y6
'
## mean latent intercept that is allowed to vary, and constrained residual variances ####
DF$modef$gm$m6y2 <-'
# intercept
i =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5 + 1*y6
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
y4~~r*y4
y5~~r*y5
y6~~r*y6
'
## mean latent intercept that is allowed to vary, mean latent slope, and constrained residual variances ####
DF$modef$gm$m6y3 <- '
# intercept
i =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5 + 1*y6
# slope
s =~ 0*y1 + 1*y2 + 2*y3 + 3*y4 + 4*y5 + 5*y6
s~0*1
s~~0*i
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
y4~~r*y4
y5~~r*y5
y6~~r*y6
'
## mean latent intercept that is allowed to vary, mean latent slope that is allowed to vary, and constrained residual variances ####
DF$modef$gm$m6y4 <- '
# intercept
i =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5 + 1*y6
# slope
s =~ 0*y1 + 1*y2 + 2*y3 + 3*y4 + 4*y5 + 5*y6
# residual variances
y1~~r*y1
y2~~r*y2
y3~~r*y3
y4~~r*y4
y5~~r*y5
y6~~r*y6
'
## unconstrained model ####
DF$modef$gm$m6y5 <-'
# intercept
i =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5 + 1*y6
# slope
s =~ 0*y1 + 1*y2 + 2*y3 + 3*y4 + 4*y5 + 5*y6
'
