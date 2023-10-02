# Jeroen D. Mulder: https://jeroendmulder.github.io/RI-CLPM/lavaan.html

# CLPM ####
## CLPModell 3 Wellen unconstrained Mulder ####
DF$clpm_L3 <- '
# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3

# Estimate lagged effects between within-person centered variables
Lx2 + Ly2 ~ Lx1 + Ly1
Lx3 + Ly3 ~ Lx2 + Ly2

# Estimate covariance between within-person centered variables
Lx1 ~~ Ly1 # Covariance
Lx2 ~~ Ly2
Lx3 ~~ Ly3

# Estimate (residual) variance of within-person centered variables
Lx1 ~~ Lx1 # Variances
Ly1 ~~ Ly1 
Lx2 ~~ Lx2 # Residual variances
Ly2 ~~ Ly2 
Lx3 ~~ Lx3 
Ly3 ~~ Ly3'  

## CLPModell 3 Wellen constrained  Mulder ####
DF$clpm_L3C <- '
# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3

# Estimate lagged effects between within-person centered variables 
# (constrained)
Lx2 ~ a*Lx1 + b*Ly1 
Ly2 ~ c*Lx1 + d*Ly1
Lx3 ~ a*Lx2 + b*Ly2
Ly3 ~ c*Lx2 + d*Ly2

# Estimate covariances between residuals of within-person centered variables 
# (i.e., innovations, constrained)
Lx2 ~~ cov*Ly2
Lx3 ~~ cov*Ly3

# Estimate covariance between within-person centered variables at first wave
Lx1 ~~ Ly1 # Covariance

# Estimate (residual) variance of within-person centered variables 
# (constrained)
Lx1 ~~ Lx1 # Variance
Ly1 ~~ Ly1 
Lx2 ~~ vx*Lx2 # Residual variance
Ly2 ~~ vy*Ly2 
Lx3 ~~ vx*Lx3 
Ly3 ~~ vy*Ly3 

# Constrain grand means over time
x1 + x2 + x3 ~ mx*1
y1 + y2 + y3 ~ my*1'

## CLPModell 3 Wellen unconstrained Mulder 2 Lags ####
DF$clpm_L3l2m <- '
# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
  
# Estimate lagged effects between within-person centered variables
Lx2 + Ly2 ~ Lx1 + Ly1
Lx3 + Ly3 ~ Lx2 + Ly2 + Lx1 + Ly1

# Estimate covariance between within-person centered variables
Lx1 ~~ Ly1 # Covariance
Lx2 ~~ Ly2
Lx3 ~~ Ly3

# Estimate (residual) variance of within-person centered variables
Lx1 ~~ Lx1 # Variances
Ly1 ~~ Ly1 
Lx2 ~~ Lx2 # Residual variances
Ly2 ~~ Ly2 
Lx3 ~~ Lx3 
Ly3 ~~ Ly3 '  

## CLPModell 4 Wellen unconstrained Mulder ####
DF$clpm_L4 <- '
# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Lx4 =~ 1*x4
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
Ly4 =~ 1*y4

# Estimate lagged effects between within-person centered variables
Lx2 + Ly2 ~ Lx1 + Ly1
Lx3 + Ly3 ~ Lx2 + Ly2
Lx4 + Ly4 ~ Lx3 + Ly3

# Estimate covariance between within-person centered variables
Lx1 ~~ Ly1 # Covariance
Lx2 ~~ Ly2
Lx3 ~~ Ly3
Lx4 ~~ Ly4

# Estimate (residual) variance of within-person centered variables
Lx1 ~~ Lx1 # Variances
Ly1 ~~ Ly1 
Lx2 ~~ Lx2 # Residual variances
Ly2 ~~ Ly2 
Lx3 ~~ Lx3 
Ly3 ~~ Ly3 
Lx4 ~~ Lx4 
Ly4 ~~ Ly4'  

## CLPModell 4 Wellen constrained  Mulder ####
DF$clpm_L4C <- '
# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Lx4 =~ 1*x4
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
Ly4 =~ 1*y4

# Estimate lagged effects between within-person centered variables 
# (constrained)
Lx2 ~ a*Lx1 + b*Ly1 
Ly2 ~ c*Lx1 + d*Ly1
Lx3 ~ a*Lx2 + b*Ly2
Ly3 ~ c*Lx2 + d*Ly2
Lx4 ~ a*Lx3 + b*Ly3
Ly4 ~ c*Lx3 + d*Ly3

# Estimate covariances between residuals of within-person centered variables 
# (i.e., innovations, constrained)
Lx2 ~~ cov*Ly2
Lx3 ~~ cov*Ly3
Lx4 ~~ cov*Ly4 

# Estimate covariance between within-person centered variables at first wave
Lx1 ~~ Ly1 # Covariance

# Estimate (residual) variance of within-person centered variables 
# (constrained)
Lx1 ~~ Lx1 # Variance
Ly1 ~~ Ly1 
Lx2 ~~ vx*Lx2 # Residual variance
Ly2 ~~ vy*Ly2 
Lx3 ~~ vx*Lx3 
Ly3 ~~ vy*Ly3 
Lx4 ~~ vx*Lx4 
Ly4 ~~ vy*Ly4 

# Constrain grand means over time
x1 + x2 + x3 + x4 ~ mx*1
y1 + y2 + y3 + y4 ~ my*1'

## CLPModell 5 Wellen unconstrained Mulder ####
DF$clpm_L5 <- '
# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Lx4 =~ 1*x4
Lx5 =~ 1*x5
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
Ly4 =~ 1*y4
Ly5 =~ 1*y5

# Estimate lagged effects between within-person centered variables
Lx2 + Ly2 ~ Lx1 + Ly1
Lx3 + Ly3 ~ Lx2 + Ly2
Lx4 + Ly4 ~ Lx3 + Ly3
Lx5 + Ly5 ~ Lx4 + Ly4

# Estimate covariance between within-person centered variables
Lx1 ~~ Ly1 # Covariance
Lx2 ~~ Ly2
Lx3 ~~ Ly3
Lx4 ~~ Ly4
Lx5 ~~ Ly5

# Estimate (residual) variance of within-person centered variables
Lx1 ~~ Lx1 # Variances
Ly1 ~~ Ly1 
Lx2 ~~ Lx2 # Residual variances
Ly2 ~~ Ly2 
Lx3 ~~ Lx3 
Ly3 ~~ Ly3 
Lx4 ~~ Lx4 
Ly4 ~~ Ly4 
Lx5 ~~ Lx5
Ly5 ~~ Ly5'  

## CLPModell 5 Wellen constrained  Mulder ####
DF$clpm_L5C <- '
# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Lx4 =~ 1*x4
Lx5 =~ 1*x5
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
Ly4 =~ 1*y4
Ly5 =~ 1*y5

# Estimate lagged effects between within-person centered variables 
# (constrained)
Lx2 ~ a*Lx1 + b*Ly1 
Ly2 ~ c*Lx1 + d*Ly1
Lx3 ~ a*Lx2 + b*Ly2
Ly3 ~ c*Lx2 + d*Ly2
Lx4 ~ a*Lx3 + b*Ly3
Ly4 ~ c*Lx3 + d*Ly3
Lx5 ~ a*Lx4 + b*Ly4
Ly5 ~ c*Lx4 + d*Ly4

# Estimate covariances between residuals of within-person centered variables 
# (i.e., innovations, constrained)
Lx2 ~~ cov*Ly2
Lx3 ~~ cov*Ly3
Lx4 ~~ cov*Ly4 
Lx5 ~~ cov*Ly5

# Estimate covariance between within-person centered variables at first wave
Lx1 ~~ Ly1 # Covariance

# Estimate (residual) variance of within-person centered variables 
# (constrained)
Lx1 ~~ Lx1 # Variance
Ly1 ~~ Ly1 
Lx2 ~~ vx*Lx2 # Residual variance
Ly2 ~~ vy*Ly2 
Lx3 ~~ vx*Lx3 
Ly3 ~~ vy*Ly3 
Lx4 ~~ vx*Lx4 
Ly4 ~~ vy*Ly4 
Lx5 ~~ vx*Lx5
Ly5 ~~ vy*Ly5

# Constrain grand means over time
x1 + x2 + x3 + x4 + x5 ~ mx*1
y1 + y2 + y3 + y4 + y5 ~ my*1'

## CLPModell 6 Wellen unconstrained Mulder ####
DF$clpm_L6 <-'
# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Lx4 =~ 1*x4
Lx5 =~ 1*x5
Lx6 =~ 1*x6
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
Ly4 =~ 1*y4
Ly5 =~ 1*y5
Ly6 =~ 1*y6

# Estimate lagged effects between within-person centered variables
Lx2 + Ly2 ~ Lx1 + Ly1
Lx3 + Ly3 ~ Lx2 + Ly2
Lx4 + Ly4 ~ Lx3 + Ly3
Lx5 + Ly5 ~ Lx4 + Ly4
Lx6 + Ly6 ~ Lx5 + Ly5

# Estimate covariance between within-person centered variables
Lx1 ~~ Ly1 # Covariance
Lx2 ~~ Ly2
Lx3 ~~ Ly3
Lx4 ~~ Ly4
Lx5 ~~ Ly5
Lx6 ~~ Ly6

# Estimate (residual) variance of within-person centered variables
Lx1 ~~ Lx1 # Variances
Ly1 ~~ Ly1 
Lx2 ~~ Lx2 # Residual variances
Ly2 ~~ Ly2 
Lx3 ~~ Lx3 
Ly3 ~~ Ly3 
Lx4 ~~ Lx4 
Ly4 ~~ Ly4 
Lx5 ~~ Lx5
Ly5 ~~ Ly5
Lx6 ~~ Lx6
Ly6 ~~ Ly6'  
## CLPModell 6 Wellen constrained  Mulder ####
DF$clpm_L6C <- '
# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Lx4 =~ 1*x4
Lx5 =~ 1*x5
Lx6 =~ 1*x6
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
Ly4 =~ 1*y4
Ly5 =~ 1*y5
Ly6 =~ 1*y6
  
# Estimate lagged effects between within-person centered variables 
# (constrained)
Lx2 ~ a*Lx1 + b*Ly1 
Ly2 ~ c*Lx1 + d*Ly1
Lx3 ~ a*Lx2 + b*Ly2
Ly3 ~ c*Lx2 + d*Ly2
Lx4 ~ a*Lx3 + b*Ly3
Ly4 ~ c*Lx3 + d*Ly3
Lx5 ~ a*Lx4 + b*Ly4
Ly5 ~ c*Lx4 + d*Ly4
Lx6 ~ a*Lx5 + b*Ly5
Ly6 ~ c*Lx5 + d*Ly5
  
# Estimate covariances between residuals of within-person centered variables 
# (i.e., innovations, constrained)
Lx2 ~~ cov*Ly2
Lx3 ~~ cov*Ly3
Lx4 ~~ cov*Ly4 
Lx5 ~~ cov*Ly5
Lx6 ~~ cov*Ly6
  
# Estimate covariance between within-person centered variables at first wave
Lx1 ~~ Ly1 # Covariance

# Estimate (residual) variance of within-person centered variables 
# (constrained)
Lx1 ~~ Lx1 # Variance
Ly1 ~~ Ly1 
Lx2 ~~ vx*Lx2 # Residual variance
Ly2 ~~ vy*Ly2 
Lx3 ~~ vx*Lx3 
Ly3 ~~ vy*Ly3 
Lx4 ~~ vx*Lx4 
Ly4 ~~ vy*Ly4 
Lx5 ~~ vx*Lx5
Ly5 ~~ vy*Ly5
Lx6 ~~ vx*Lx6
Ly6 ~~ vy*Ly6

# Constrain grand means over time
x1 + x2 + x3 + x4 + x5 + x6 ~ mx*1
y1 + y2 + y3 + y4 + y5 + y6 ~ my*1'


#  RICLPM ####
## RI-CLPModell 3 Wellen unconstrained  Mulder ####
DF$riclpm3 <- '
# Create between components (random intercepts)
RIx =~ 1*x1 + 1*x2 + 1*x3
RIy =~ 1*y1 + 1*y2 + 1*y3

# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3

# Estimate lagged effects between within-person centered variables
Lx3 + Ly3 ~ Lx2 + Ly2
Lx2 + Ly2 ~ Lx1 + Ly1

# Estimate covariance between within-person centered variables at first wave
Lx1 ~~ Ly1 # Covariance

# Estimate covariances between residuals of within-person centered variables 
# (i.e., innovations)
Lx2 ~~ Ly2
Lx3 ~~ Ly3

# Estimate variance and covariance of random intercepts
RIx ~~ RIx
RIy ~~ RIy
RIx ~~ RIy

# Estimate (residual) variance of within-person centered variables
Lx1 ~~ Lx1 # Variances
Ly1 ~~ Ly1 
Lx2 ~~ Lx2 # Residual variances
Ly2 ~~ Ly2 
Lx3 ~~ Lx3 
Ly3 ~~ Ly3 '

## RI-CLPModell 3 Wellen constrained  Mulder ####
DF$riclpm3C <- '
# Create between components (random intercepts)
RIx =~ 1*x1 + 1*x2 + 1*x3
RIy =~ 1*y1 + 1*y2 + 1*y3

# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3

# Estimate lagged effects between within-person centered variables 
# (constrained)
Lx2 ~ a*Lx1 + b*Ly1 
Ly2 ~ c*Lx1 + d*Ly1
Lx3 ~ a*Lx2 + b*Ly2
Ly3 ~ c*Lx2 + d*Ly2

# Estimate covariances between residuals of within-person centered variables 
# (i.e., innovations, constrained)
Lx2 ~~ cov*Ly2
Lx3 ~~ cov*Ly3

# Estimate covariance between within-person centered variables at first wave
Lx1 ~~ Ly1 # Covariance
  
# Estimate variance and covariance of random intercepts
RIx ~~ RIx
RIy ~~ RIy
RIx ~~ RIy
  
# Estimate (residual) variance of within-person centered variables 
# (constrained)
Lx1 ~~ Lx1 # Variance
Ly1 ~~ Ly1 
Lx2 ~~ vx*Lx2 # Residual variance
Ly2 ~~ vy*Ly2 
Lx3 ~~ vx*Lx3 
Ly3 ~~ vy*Ly3 

# Constrain grand means over time
x1 + x2 + x3 ~ mx*1
y1 + y2 + y3 ~ my*1'

## RI-CLPModell 4 Wellen unconstrained  Mulder ####
DF$riclpm4 <- '
# Create between components (random intercepts)
RIx =~ 1*x1 + 1*x2 + 1*x3 + 1*x4
RIy =~ 1*y1 + 1*y2 + 1*y3 + 1*y4

# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Lx4 =~ 1*x4
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
Ly4 =~ 1*y4

# Estimate lagged effects between within-person centered variables
Lx4 + Ly4 ~ Lx3 + Ly3
Lx3 + Ly3 ~ Lx2 + Ly2
Lx2 + Ly2 ~ Lx1 + Ly1

# Estimate covariance between within-person centered variables at first wave
Lx1 ~~ Ly1 # Covariance

# Estimate covariances between residuals of within-person centered variables 
# (i.e., innovations)
Lx2 ~~ Ly2
Lx3 ~~ Ly3
Lx4 ~~ Ly4

  # Estimate variance and covariance of random intercepts
RIx ~~ RIx
RIy ~~ RIy
RIx ~~ RIy

# Estimate (residual) variance of within-person centered variables
Lx1 ~~ Lx1 # Variances
Ly1 ~~ Ly1 
Lx2 ~~ Lx2 # Residual variances
Ly2 ~~ Ly2 
Lx3 ~~ Lx3 
Ly3 ~~ Ly3 
Lx4 ~~ Lx4 
Ly4 ~~ Ly4'

## RI-CLPModell 4 Wellen constrained  Mulder ####
DF$riclpm4C <- '
# Create between components (random intercepts)
RIx =~ 1*x1 + 1*x2 + 1*x3 + 1*x4
RIy =~ 1*y1 + 1*y2 + 1*y3 + 1*y4

# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Lx4 =~ 1*x4
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
Ly4 =~ 1*y4

  
# Estimate lagged effects between within-person centered variables 
# (constrained)
Lx2 ~ a*Lx1 + b*Ly1 
Ly2 ~ c*Lx1 + d*Ly1
Lx3 ~ a*Lx2 + b*Ly2
Ly3 ~ c*Lx2 + d*Ly2
Lx4 ~ a*Lx3 + b*Ly3
Ly4 ~ c*Lx3 + d*Ly3

# Estimate covariances between residuals of within-person centered variables 
# (i.e., innovations, constrained)
Lx2 ~~ cov*Ly2
Lx3 ~~ cov*Ly3
Lx4 ~~ cov*Ly4 

# Estimate covariance between within-person centered variables at first wave
Lx1 ~~ Ly1 # Covariance
  
# Estimate variance and covariance of random intercepts
RIx ~~ RIx
RIy ~~ RIy
RIx ~~ RIy
  
# Estimate (residual) variance of within-person centered variables 
# (constrained)
Lx1 ~~ Lx1 # Variance
Ly1 ~~ Ly1 
Lx2 ~~ vx*Lx2 # Residual variance
Ly2 ~~ vy*Ly2 
Lx3 ~~ vx*Lx3 
Ly3 ~~ vy*Ly3 
Lx4 ~~ vx*Lx4 
Ly4 ~~ vy*Ly4 

# Constrain grand means over time
x1 + x2 + x3 + x4 ~ mx*1
y1 + y2 + y3 + y4 ~ my*1'


## RI-CLPModell 5 Wellen unconstrained  Mulder ####
DF$riclpm5 <- '
# Create between components (random intercepts)
RIx =~ 1*x1 + 1*x2 + 1*x3 + 1*x4 + 1*x5
RIy =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5

# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Lx4 =~ 1*x4
Lx5 =~ 1*x5
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
Ly4 =~ 1*y4
Ly5 =~ 1*y5

# Estimate lagged effects between within-person centered variables
Lx5 + Ly5 ~ Lx4 + Ly4
Lx4 + Ly4 ~ Lx3 + Ly3
Lx3 + Ly3 ~ Lx2 + Ly2
Lx2 + Ly2 ~ Lx1 + Ly1

# Estimate covariance between within-person centered variables at first wave
Lx1 ~~ Ly1 # Covariance

# Estimate covariances between residuals of within-person centered variables 
# (i.e., innovations)
Lx2 ~~ Ly2
Lx3 ~~ Ly3
Lx4 ~~ Ly4
Lx5 ~~ Ly5
  
# Estimate variance and covariance of random intercepts
RIx ~~ RIx
RIy ~~ RIy
RIx ~~ RIy

# Estimate (residual) variance of within-person centered variables
Lx1 ~~ Lx1 # Variances
Ly1 ~~ Ly1 
Lx2 ~~ Lx2 # Residual variances
Ly2 ~~ Ly2 
Lx3 ~~ Lx3 
Ly3 ~~ Ly3 
Lx4 ~~ Lx4 
Ly4 ~~ Ly4 
Lx5 ~~ Lx5
Ly5 ~~ Ly5'

## RI-CLPModell 5 Wellen constrained  Mulder ####
DF$riclpm5C <- '
# Create between components (random intercepts)
RIx =~ 1*x1 + 1*x2 + 1*x3 + 1*x4 + 1*x5
RIy =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5

# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Lx4 =~ 1*x4
Lx5 =~ 1*x5
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
Ly4 =~ 1*y4
Ly5 =~ 1*y5

# Estimate lagged effects between within-person centered variables 
# (constrained)
Lx2 ~ a*Lx1 + b*Ly1 
Ly2 ~ c*Lx1 + d*Ly1
Lx3 ~ a*Lx2 + b*Ly2
Ly3 ~ c*Lx2 + d*Ly2
Lx4 ~ a*Lx3 + b*Ly3
Ly4 ~ c*Lx3 + d*Ly3
Lx5 ~ a*Lx4 + b*Ly4
Ly5 ~ c*Lx4 + d*Ly4

# Estimate covariances between residuals of within-person centered variables 
# (i.e., innovations, constrained)
Lx2 ~~ cov*Ly2
Lx3 ~~ cov*Ly3
Lx4 ~~ cov*Ly4 
Lx5 ~~ cov*Ly5

# Estimate covariance between within-person centered variables at first wave
Lx1 ~~ Ly1 # Covariance

# Estimate variance and covariance of random intercepts
RIx ~~ RIx
RIy ~~ RIy
RIx ~~ RIy

# Estimate (residual) variance of within-person centered variables 
# (constrained)
Lx1 ~~ Lx1 # Variance
Ly1 ~~ Ly1 
Lx2 ~~ vx*Lx2 # Residual variance
Ly2 ~~ vy*Ly2 
Lx3 ~~ vx*Lx3 
Ly3 ~~ vy*Ly3 
Lx4 ~~ vx*Lx4 
Ly4 ~~ vy*Ly4 
Lx5 ~~ vx*Lx5
Ly5 ~~ vy*Ly5

# Constrain grand means over time
x1 + x2 + x3 + x4 + x5 ~ mx*1
y1 + y2 + y3 + y4 + y5 ~ my*1'

## RI-CLPModell 5 Wellen a time-invariant predictor of the observed variables ####
DF$riclpm5CV <- '
# Create between components (random intercepts)
RIx =~ 1*x1 + 1*x2 + 1*x3 + 1*x4 + 1*x5
RIy =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5
  
# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Lx4 =~ 1*x4
Lx5 =~ 1*x5
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
Ly4 =~ 1*y4
Ly5 =~ 1*y5
  
# Regression of observed variables on z1 (constrained)
x1 + x2 + x3 + x4 + x5 ~ s1*z1 # Constrained over time. 
y1 + y2 + y3 + y4 + y5 ~ s2*z1 # Constrained over time. 
  
# Estimate lagged effects between within-person centered variables
Lx2 + Ly2 ~ Lx1 + Ly1
Lx3 + Ly3 ~ Lx2 + Ly2
Lx4 + Ly4 ~ Lx3 + Ly3
Lx5 + Ly5 ~ Lx4 + Ly4
  
# Estimate covariance between within-person centered variables at first wave
Lx1 ~~ Ly1 # Covariance
  
# Estimate covariances between residuals of within-person centered variables
# (i.e., innovations)
Lx2 ~~ Ly2
Lx3 ~~ Ly3
Lx4 ~~ Ly4
Lx5 ~~ Ly5

# Estimate variance and covariance of random intercepts
RIx ~~ RIx
RIy ~~ RIy
RIx ~~ RIy

# Estimate (residual) variance of within-person centered variables
Lx1 ~~ Lx1 # Variances
Ly1 ~~ Ly1 
Lx2 ~~ Lx2 # Residual variances
Ly2 ~~ Ly2 
Lx3 ~~ Lx3 
Ly3 ~~ Ly3 
Lx4 ~~ Lx4 
Ly4 ~~ Ly4 
Lx5 ~~ Lx5
Ly5 ~~ Ly5 '


## RI-CLPModell 6 Wellen unconstrained  Mulder ####
DF$riclpm6 <- '
# Create between components (random intercepts)
RIx =~ 1*x1 + 1*x2 + 1*x3 + 1*x4 + 1*x5 + 1*x6
RIy =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5 + 1*y6

# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Lx4 =~ 1*x4
Lx5 =~ 1*x5
Lx6 =~ 1*x6
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
Ly4 =~ 1*y4
Ly5 =~ 1*y5
Ly6 =~ 1*y6

# Estimate lagged effects between within-person centered variables
Lx6 + Ly6 ~ Lx5 + Ly5
Lx5 + Ly5 ~ Lx4 + Ly4
Lx4 + Ly4 ~ Lx3 + Ly3
Lx3 + Ly3 ~ Lx2 + Ly2
Lx2 + Ly2 ~ Lx1 + Ly1

# Estimate covariance between within-person centered variables at first wave
Lx1 ~~ Ly1 # Covariance

# Estimate covariances between residuals of within-person centered variables 
# (i.e., innovations)
Lx2 ~~ Ly2
Lx3 ~~ Ly3
Lx4 ~~ Ly4
Lx5 ~~ Ly5
Lx6 ~~ Ly6
  
  # Estimate variance and covariance of random intercepts
RIx ~~ RIx
RIy ~~ RIy
RIx ~~ RIy

# Estimate (residual) variance of within-person centered variables
Lx1 ~~ Lx1 # Variances
Ly1 ~~ Ly1 
Lx2 ~~ Lx2 # Residual variances
Ly2 ~~ Ly2 
Lx3 ~~ Lx3 
Ly3 ~~ Ly3 
Lx4 ~~ Lx4 
Ly4 ~~ Ly4 
Lx5 ~~ Lx5
Ly5 ~~ Ly5
Lx6 ~~ Lx6
Ly6 ~~ Ly6'

## RI-CLPModell 6 Wellen constrained  Mulder ####
DF$riclpm6C <- '
# Create between components (random intercepts)
RIx =~ 1*x1 + 1*x2 + 1*x3 + 1*x4 + 1*x5 + 1*x6
RIy =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5 + 1*y6

# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Lx4 =~ 1*x4
Lx5 =~ 1*x5
Lx5 =~ 1*x6
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
Ly4 =~ 1*y4
Ly5 =~ 1*y5
Ly6 =~ 1*y6
  
# Estimate lagged effects between within-person centered variables 
# (constrained)
Lx2 ~ a*Lx1 + b*Ly1 
Ly2 ~ c*Lx1 + d*Ly1
Lx3 ~ a*Lx2 + b*Ly2
Ly3 ~ c*Lx2 + d*Ly2
Lx4 ~ a*Lx3 + b*Ly3
Ly4 ~ c*Lx3 + d*Ly3
Lx5 ~ a*Lx4 + b*Ly4
Ly5 ~ c*Lx4 + d*Ly4
Lx6 ~ a*Lx5 + b*Ly5
Ly6 ~ c*Lx5 + d*Ly5
  
# Estimate covariances between residuals of within-person centered variables 
# (i.e., innovations, constrained)
Lx2 ~~ cov*Ly2
Lx3 ~~ cov*Ly3
Lx4 ~~ cov*Ly4 
Lx5 ~~ cov*Ly5
Lx6 ~~ cov*Ly6
  
# Estimate covariance between within-person centered variables at first wave
Lx1 ~~ Ly1 # Covariance

# Estimate variance and covariance of random intercepts
RIx ~~ RIx
RIy ~~ RIy
RIx ~~ RIy
  
# Estimate (residual) variance of within-person centered variables 
# (constrained)
Lx1 ~~ Lx1 # Variance
Ly1 ~~ Ly1 
Lx2 ~~ vx*Lx2 # Residual variance
Ly2 ~~ vy*Ly2 
Lx3 ~~ vx*Lx3 
Ly3 ~~ vy*Ly3 
Lx4 ~~ vx*Lx4 
Ly4 ~~ vy*Ly4 
Lx5 ~~ vx*Lx5
Ly5 ~~ vy*Ly5
Lx6 ~~ vx*Lx6
Ly6 ~~ vy*Ly6

# Constrain grand means over time
x1 + x2 + x3 + x4 + x5 + x6 ~ mx*1
y1 + y2 + y3 + y4 + y5 + y6 ~ my*1'
## RI-CLPModell 6 Wellen a time-invariant predictor of the observed variables ####
DF$riclpm6CV <- '
# Create between components (random intercepts)
RIx =~ 1*x1 + 1*x2 + 1*x3 + 1*x4 + 1*x5 + 1*x6
RIy =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5 + 1*y6

# Create within-person centered variables
Lx1 =~ 1*x1
Lx2 =~ 1*x2
Lx3 =~ 1*x3 
Lx4 =~ 1*x4
Lx5 =~ 1*x5
Lx6 =~ 1*x6
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
Ly4 =~ 1*y4
Ly5 =~ 1*y5
Ly6 =~ 1*y6
  
# Regression of observed variables on z1 (constrained)
x1 + x2 + x3 + x4 + x5 ~ s1*z1 # Constrained over time. 
y1 + y2 + y3 + y4 + y5 ~ s2*z1 # Constrained over time. 
  
# Estimate lagged effects between within-person centered variables
Lx6 + Ly6 ~ Lx5 + Ly5
Lx5 + Ly5 ~ Lx4 + Ly4
Lx4 + Ly4 ~ Lx3 + Ly3
Lx3 + Ly3 ~ Lx2 + Ly2
Lx2 + Ly2 ~ Lx1 + Ly1

# Estimate covariance between within-person centered variables at first wave
Lx1 ~~ Ly1 # Covariance

# Estimate covariances between residuals of within-person centered variables 
# (i.e., innovations)
Lx2 ~~ Ly2
Lx3 ~~ Ly3
Lx4 ~~ Ly4
Lx5 ~~ Ly5
Lx6 ~~ Ly6
  
  # Estimate variance and covariance of random intercepts
RIx ~~ RIx
RIy ~~ RIy
RIx ~~ RIy

# Estimate (residual) variance of within-person centered variables
Lx1 ~~ Lx1 # Variances
Ly1 ~~ Ly1 
Lx2 ~~ Lx2 # Residual variances
Ly2 ~~ Ly2 
Lx3 ~~ Lx3 
Ly3 ~~ Ly3 
Lx4 ~~ Lx4 
Ly4 ~~ Ly4 
Lx5 ~~ Lx5
Ly5 ~~ Ly5
Lx6 ~~ Lx6
Ly6 ~~ Ly6'


# GCLM jsakaluk ####
## GCML 3 Wellen ####
DF$gcmlT3 <-
  '
#unit effects
eta_x =~ x1+x2+x3
eta_y =~ y1+y2+y3

#impulses
u_x1 =~ x1 
u_x2 =~ x2 
u_x3 =~ x3
x1 ~~ 0*x1 
x2 ~~ 0*x2 
x3 ~~ 0*x3
u_y1 =~ y1 
u_y2 =~ y2 
u_y3 =~ y3
y1 ~~ 0*y1 
y2 ~~ 0*y2 
y3 ~~ 0*y3

#regressions
x2 ~ a*x1 + b*y1 + c*u_x1 + d*u_y1 
x3 ~ a*x2 + b*y2 + c*u_x2 + d*u_y2
y2 ~ f*x1 + g*y1 + h*u_x1 + i*u_y1 
y3 ~ f*x2 + g*y2 + h*u_x2 + i*u_y2

#co-movements
u_x1 ~~ u_y1 
u_x2 ~~ u_y2 
u_x3 ~~ u_y3

#restrictions
u_x1 ~~ 0*eta_x + 0*eta_y + 0*u_x2+0*u_x3+0*u_y1+0*u_y2+0*u_y3
u_x2 ~~ 0*eta_x + 0*eta_y + 0*u_x3+0*u_y1+0*u_y2+0*u_y3
u_x3 ~~ 0*eta_x + 0*eta_y + 0*u_y1+0*u_y2+0*u_y3
u_y1 ~~ 0*eta_x + 0*eta_y + 0*u_y2+0*u_y3
u_y2 ~~ 0*eta_x + 0*eta_y + 0*u_y3
u_y3 ~~ 0*eta_x + 0*eta_y  
'

## GCLM 5 Wellen Code von Sakaluk https://github.com/jsakaluk ####
DF$gclm5 <-
  '
eta_x =~ x1+x2+x3+x4+x5
eta_y =~ y1+y2+y3+y4+y5
#unit effects

#impulses
u_x1 =~ x1 
u_x2 =~ x2 
u_x3 =~ x3 
u_x4 =~ x4 
u_x5 =~ x5
x1 ~~ 0*x1 
x2 ~~ 0*x2 
x3 ~~ 0*x3 
x4 ~~ 0*x4 
x5 ~~ 0*x5
u_y1 =~ y1 
u_y2 =~ y2 
u_y3 =~ y3 
u_y4 =~ y4 
u_y5 =~ y5
y1 ~~ 0*y1 
y2 ~~ 0*y2 
y3 ~~ 0*y3 
y4 ~~ 0*y4 
y5 ~~ 0*y5

#regressions
x2 ~ a*x1 + b*y1 + c*u_x1 + d*u_y1 
x3 ~ a*x2 + b*y2 + c*u_x2 + d*u_y2 
x4 ~ a*x3 + b*y3 + c*u_x3 + d*u_y3 
x5 ~ a*x4 + b*y4 + c*u_x4 + d*u_y4
y2 ~ f*x1 + g*y1 + h*u_x1 + i*u_y1 
y3 ~ f*x2 + g*y2 + h*u_x2 + i*u_y2 
y4 ~ f*x3 + g*y3 + h*u_x3 + i*u_y3 
y5 ~ f*x4 + g*y4 + h*u_x4 + i*u_y4

#co-movements
u_x1 ~~ u_y1 
u_x2 ~~ u_y2 
u_x3 ~~ u_y3 
u_x4 ~~ u_y4 
u_x5 ~~ u_y5

#restrictions
u_x1 ~~ 0*eta_x + 0*eta_y + 0*u_x2+0*u_x3+0*u_x4+0*u_x5+0*u_y1+0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_x2 ~~ 0*eta_x + 0*eta_y + 0*u_x3+0*u_x4+0*u_x5+0*u_y1+0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_x3 ~~ 0*eta_x + 0*eta_y + 0*u_x4+0*u_x5+0*u_y1+0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_x4 ~~ 0*eta_x + 0*eta_y + 0*u_x5+0*u_y1+0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_x5 ~~ 0*eta_x + 0*eta_y + 0*u_y1+0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_y1 ~~ 0*eta_x + 0*eta_y + 0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_y2 ~~ 0*eta_x + 0*eta_y + 0*u_y3+0*u_y4+0*u_y5
u_y3 ~~ 0*eta_x + 0*eta_y + 0*u_y4+0*u_y5
u_y4 ~~ 0*eta_x + 0*eta_y + 0*u_y5
u_y5 ~~ 0*eta_x + 0*eta_y  
'
## GCML 6 Wellen
#unit effects
DF$gclm6 <- 'eta_x =~ x1+x2+x3+x4+x5
eta_y =~ y1+y2+y3+y4+y5

#impulses
u_x1 =~ x1 
u_x2 =~ x2 
u_x3 =~ x3 
u_x4 =~ x4 
u_x5 =~ x5
x1 ~~ 0*x1 
x2 ~~ 0*x2 
x3 ~~ 0*x3 
x4 ~~ 0*x4 
x5 ~~ 0*x5
u_y1 =~ y1 
u_y2 =~ y2 
u_y3 =~ y3 
u_y4 =~ y4 
u_y5 =~ y5
y1 ~~ 0*y1 
y2 ~~ 0*y2 
y3 ~~ 0*y3 
y4 ~~ 0*y4 
y5 ~~ 0*y5

#regressions
x2 ~ a*x1 + b*y1 + c*u_x1 + d*u_y1 
x3 ~ a*x2 + b*y2 + c*u_x2 + d*u_y2 
x4 ~ a*x3 + b*y3 + c*u_x3 + d*u_y3 
x5 ~ a*x4 + b*y4 + c*u_x4 + d*u_y4
y2 ~ f*x1 + g*y1 + h*u_x1 + i*u_y1 
y3 ~ f*x2 + g*y2 + h*u_x2 + i*u_y2 
y4 ~ f*x3 + g*y3 + h*u_x3 + i*u_y3 
y5 ~ f*x4 + g*y4 + h*u_x4 + i*u_y4

#co-movements
u_x1 ~~ u_y1 
u_x2 ~~ u_y2 
u_x3 ~~ u_y3 
u_x4 ~~ u_y4 
u_x5 ~~ u_y5

#restrictions
u_x1 ~~ 0*eta_x + 0*eta_y + 0*u_x2+0*u_x3+0*u_x4+0*u_x5+0*u_y1+0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_x2 ~~ 0*eta_x + 0*eta_y + 0*u_x3+0*u_x4+0*u_x5+0*u_y1+0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_x3 ~~ 0*eta_x + 0*eta_y + 0*u_x4+0*u_x5+0*u_y1+0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_x4 ~~ 0*eta_x + 0*eta_y + 0*u_x5+0*u_y1+0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_x5 ~~ 0*eta_x + 0*eta_y + 0*u_y1+0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_y1 ~~ 0*eta_x + 0*eta_y + 0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_y2 ~~ 0*eta_x + 0*eta_y + 0*u_y3+0*u_y4+0*u_y5
u_y3 ~~ 0*eta_x + 0*eta_y + 0*u_y4+0*u_y5
u_y4 ~~ 0*eta_x + 0*eta_y + 0*u_y5
u_y5 ~~ 0*eta_x + 0*eta_y'  


# Usami ####
## RI-CLPM 3 Wellen Usami-Code ####
DF$RICLPMT3 <- '
# Intercepts
x1~mux1*1; y1~muy1*1
x2~mux2*1; y2~muy2*1
x3~mux3*1; y3~muy3*1

#VARIANCES @0 OF OBSERVED SCORES
x1~~0*x1; y1~~0*y1;
x2~~0*x2; y2~~0*y2;
x3~~0*x3; y3~~0*y3;

#Latent Vars
FFy1 =~ 1*y1; FFy2 =~ 1*y2; FFy3 =~ 1*y3
FFx1 =~ 1*x1; FFx2 =~ 1*x2; FFx3 =~ 1*x3
Ix=~1*x1+1*x2+1*x3
Iy=~1*y1+1*y2+1*y3
Ix~~0*FFx1;Ix~~0*FFy1; Iy~~0*FFx1;Iy~~0*FFy1;
Ix~~taux*Ix; Iy~~tauy*Iy; Ix~~tauxy*Iy
Ix~0*1; Iy~0*1
FFx1~ 0*1;FFy1~0*1

FFy2~ betay*FFy1+gammay*FFx1; FFx2~ betax*FFx1+gammax*FFy1
FFy3~ betay*FFy2+gammay*FFx2; FFx3~ betax*FFx2+gammax*FFy2

# Regression
FFx1~~phix*FFx1; FFy1~~phiy*FFy1; FFx1~~phixy*FFy1
FFx2~~Omegax*FFx2; FFx3~~Omegax*FFx3
FFy2~~Omegay*FFy2; FFy3~~Omegay*FFy3
FFx2~~Omegaxy*FFy2; FFx3~~Omegaxy*FFy3
'

## GCLM(T=3) (AR(1)CL(1) model, and no correlations are assumed between initial states and accumulating factors) ####
DF$GCLMT3 <- '
x1~mux1*1; y1~muy1*1; x2~mux2*1; y2~muy2*1; x3~mux3*1; y3~muy3*1
FFy1 =~ 1*y1; FFy2 =~ 1*y2; FFy3 =~ 1*y3
FFx1 =~ 1*x1; FFx2 =~ 1*x2; FFx3 =~ 1*x3
By=~1*FFy1+1*FFy2+1*FFy3
Bx=~1*FFx1+1*FFx2+1*FFx3

FFx1~0*1; FFy1~0*1; Bx~0*1;By~0*1
FFx1~~phix1* FFx1; FFy1~~phiy1*FFy1; Bx~~phiBx*Bx;By~~phiBy*By
FFx1~~0*Bx; FFx1~~0*By; 
FFy1~~0*Bx; FFy1~~0*By; 
Bx~~phiBxBy*By
FFx1~~phix1y1* FFy1; 
x1 ~~ 0*x1; x2 ~~ 0*x2; x3 ~~ 0*x3
y1 ~~ 0*y1; y2 ~~ 0*y2; y3 ~~ 0*y3
y1 ~~ 0*x1; y2 ~~ 0*x2; y3 ~~ 0*x3

FFy2~ betay*FFy1+gammay*FFx1; FFx2~ betax*FFx1+gammax*FFy1
FFy3~ betay*FFy2+gammay*FFx2; FFx3~ betax*FFx2+gammax*FFy2
FFx2~~ Omegax*FFx2; FFx3~~Omegax*FFx3
FFy2~~ Omegay*FFy2; FFy3~~Omegay*FFy3
FFx2~~ Omegaxy*FFy2; FFx3~~Omegaxy*FFy3
' 


## RI-CLPM 5 Wellen Usami-Code ####
DF$RICLPMT5 <- '
# Intercepts
x1~mux1*1; y1~muy1*1
x2~mux2*1; y2~muy2*1
x3~mux3*1; y3~muy3*1
x4~mux4*1; y4~muy4*1
x5~mux5*1; y5~muy5*1

#VARIANCES @0 OF OBSERVED SCORES
x1~~0*x1; y1~~0*y1;
x2~~0*x2; y2~~0*y2;
x3~~0*x3; y3~~0*y3;
x4~~0*x4; y4~~0*y4;
x5~~0*x5; y5~~0*y5;

#Latent Vars
FFy1 =~ 1*y1; FFy2 =~ 1*y2; FFy3 =~ 1*y3; FFy4 =~ 1*y4; FFy5 =~ 1*y5
FFx1 =~ 1*x1; FFx2 =~ 1*x2; FFx3 =~ 1*x3; FFx4 =~ 1*x4; FFx5 =~ 1*x5
Ix=~1*x1+1*x2+1*x3+1*x4+1*x5
Iy=~1*y1+1*y2+1*y3+1*y4+1*y5
Ix~~0*FFx1;Ix~~0*FFy1; Iy~~0*FFx1;Iy~~0*FFy1;
Ix~~taux*Ix; Iy~~tauy*Iy; Ix~~tauxy*Iy
Ix~0*1; Iy~0*1
FFx1~ 0*1;FFy1~0*1

FFy2~ betay*FFy1+gammay*FFx1; FFx2~ betax*FFx1+gammax*FFy1
FFy3~ betay*FFy2+gammay*FFx2; FFx3~ betax*FFx2+gammax*FFy2
FFy4~ betay*FFy3+gammay*FFx3; FFx4~ betax*FFx3+gammax*FFy3
FFy5~ betay*FFy4+gammay*FFx4; FFx5~ betax*FFx4+gammax*FFy4

# Regression
FFx1~~phix*FFx1; FFy1~~phiy*FFy1; FFx1~~phixy*FFy1
FFx2~~Omegax*FFx2; FFx3~~Omegax*FFx3; FFx4~~Omegax*FFx4; FFx5~~Omegax*FFx5
FFy2~~Omegay*FFy2; FFy3~~Omegay*FFy3; FFy4~~Omegay*FFy4; FFy5~~Omegay*FFy5
FFx2~~Omegaxy*FFy2; FFx3~~Omegaxy*FFy3; FFx4~~Omegaxy*FFy4; FFx5~~Omegaxy*FFy5
'

## RI-CLPM 6 Wellen Usami-Code ####
DF$RICLPMT6 <- '
# Intercepts
x1~mux1*1; y1~muy1*1
x2~mux2*1; y2~muy2*1
x3~mux3*1; y3~muy3*1
x4~mux4*1; y4~muy4*1
x5~mux5*1; y5~muy5*1
x6~mux6*1; y6~muy6*1

#VARIANCES @0 OF OBSERVED SCORES
x1~~0*x1; y1~~0*y1;
x2~~0*x2; y2~~0*y2;
x3~~0*x3; y3~~0*y3;
x4~~0*x4; y4~~0*y4;
x5~~0*x5; y5~~0*y5;
x6~~0*x6; y6~~0*y6;

#Latent Vars
FFy1 =~ 1*y1; FFy2 =~ 1*y2; FFy3 =~ 1*y3; FFy4 =~ 1*y4; FFy5 =~ 1*y5; FFy6 =~ 1*y6
FFx1 =~ 1*x1; FFx2 =~ 1*x2; FFx3 =~ 1*x3; FFx4 =~ 1*x4; FFx5 =~ 1*x5; FFx6 =~ 1*x6
Ix=~1*x1+1*x2+1*x3+1*x4+1*x5+1*x6
Iy=~1*y1+1*y2+1*y3+1*y4+1*y5+1*y6
Ix~~0*FFx1;Ix~~0*FFy1; Iy~~0*FFx1;Iy~~0*FFy1;
Ix~~taux*Ix; Iy~~tauy*Iy; Ix~~tauxy*Iy
Ix~0*1; Iy~0*1
FFx1~ 0*1;FFy1~0*1

FFy2~ betay*FFy1+gammay*FFx1; FFx2~ betax*FFx1+gammax*FFy1
FFy3~ betay*FFy2+gammay*FFx2; FFx3~ betax*FFx2+gammax*FFy2
FFy4~ betay*FFy3+gammay*FFx3; FFx4~ betax*FFx3+gammax*FFy3
FFy5~ betay*FFy4+gammay*FFx4; FFx5~ betax*FFx4+gammax*FFy4
FFy6~ betay*FFy5+gammay*FFx5; FFx6~ betax*FFx5+gammax*FFy5

# Regression
FFx1~~phix*FFx1; FFy1~~phiy*FFy1; FFx1~~phixy*FFy1
FFx2~~Omegax*FFx2; FFx3~~Omegax*FFx3; FFx4~~Omegax*FFx4; FFx5~~Omegax*FFx5; FFx6~~Omegax*FFx6
FFy2~~Omegay*FFy2; FFy3~~Omegay*FFy3; FFy4~~Omegay*FFy4; FFy5~~Omegay*FFy5; FFy6~~Omegay*FFy6
FFx2~~Omegaxy*FFy2; FFx3~~Omegaxy*FFy3; FFx4~~Omegaxy*FFy4; FFx5~~Omegaxy*FFy5; FFx6~~Omegaxy*FFy6
'

## GCLM(T=5) (AR(1)CL(1) model, and no correlations are assumed between initial states and accumulating factors) ####
DF$GCLMT5 <- '
x1~mux1*1; y1~muy1*1; x2~mux2*1; y2~muy2*1; x3~mux3*1; y3~muy3*1; x4~mux4*1; y4~muy4*1;
x5~mux5*1; y5~muy5*1

FFy1 =~ 1*y1; FFy2 =~ 1*y2; FFy3 =~ 1*y3; FFy4 =~ 1*y4; FFy5 =~ 1*y5
FFx1 =~ 1*x1; FFx2 =~ 1*x2; FFx3 =~ 1*x3; FFx4 =~ 1*x4; FFx5 =~ 1*x5
By=~1*FFy1+1*FFy2+1*FFy3+1*FFy4+1*FFy5
Bx=~1*FFx1+1*FFx2+1*FFx3+1*FFx4+1*FFx5

FFx1~0*1; FFy1~0*1; Bx~0*1;By~0*1
FFx1~~phix1* FFx1; FFy1~~phiy1*FFy1; Bx~~phiBx*Bx;By~~phiBy*By
FFx1~~0*Bx; FFx1~~0*By; 
FFy1~~0*Bx; FFy1~~0*By; 
Bx~~phiBxBy*By
FFx1~~phix1y1* FFy1; 
x1 ~~ 0*x1; x2 ~~ 0*x2; x3 ~~ 0*x3; x4 ~~ 0*x4; x5 ~~ 0*x5
y1 ~~ 0*y1; y2 ~~ 0*y2; y3 ~~ 0*y3; y4 ~~ 0*y4; y5 ~~ 0*y5
y1 ~~ 0*x1; y2 ~~ 0*x2; y3 ~~ 0*x3; y4 ~~ 0*x4; y5 ~~ 0*x5



FFy2 ~ betay*FFy1+gammay*FFx1
FFx2 ~ betax*FFx1+gammax*FFy1
FFy3 ~ betay*FFy2+gammay*FFx2
FFx3 ~ betax*FFx2+gammax*FFy2
FFy4 ~ betay*FFy3+gammay*FFx3
FFx4 ~ betax*FFx3+gammax*FFy3
FFy5 ~ betay*FFy4+gammay*FFx4
FFx5 ~ betax*FFx4+gammax*FFy4
FFx2 ~~ Omegax*FFx2
FFx3 ~~ Omegax*FFx3
FFx4 ~~ Omegax*FFx4
FFx5 ~~ Omegax*FFx5
FFy2 ~~ Omegay*FFy2
FFy3 ~~ Omegay*FFy3
FFy4 ~~ Omegay*FFy4
FFy5 ~~ Omegay*FFy5
FFx2 ~~ Omegaxy*FFy2
FFx3 ~~ Omegaxy*FFy3
FFx4 ~~ Omegaxy*FFy4
FFx5 ~~ Omegaxy*FFy5
' 

## GCLM(T=6) (AR(1)CL(1) model, and no correlations are assumed between initial states and accumulating factors) ####
DF$GCLMT6 <- '
x1~mux1*1; y1~muy1*1; x2~mux2*1; y2~muy2*1; x3~mux3*1; y3~muy3*1; x4~mux4*1; y4~muy4*1;
x5~mux5*1; y5~muy5*1; x6~mux6*1; y6~muy6*1
FFy1 =~ 1*y1; FFy2 =~ 1*y2; FFy3 =~ 1*y3; FFy4 =~ 1*y4; FFy5 =~ 1*y5; FFy6 =~ 1*y6
    FFx1 =~ 1*x1; FFx2 =~ 1*x2; FFx3 =~ 1*x3; FFx4 =~ 1*x4; FFx5 =~ 1*x5; FFx6 =~ 1*x6
    By=~1*FFy1+1*FFy2+1*FFy3+1*FFy4+1*FFy5+1*FFy6; Bx=~1*FFx1+1*FFx2+1*FFx3+1*FFx4+1*FFx5+1*FFx6
FFx1~0*1; FFy1~0*1; Bx~0*1;By~0*1
FFx1~~phix1* FFx1; FFy1~~phiy1*FFy1; Bx~~phiBx*Bx;By~~phiBy*By
FFx1~~0*Bx; FFx1~~0*By; 
FFy1~~0*Bx; FFy1~~0*By; 
Bx~~phiBxBy*By
FFx1~~phix1y1* FFy1; 
x1 ~~ 0*x1; x2 ~~ 0*x2; x3 ~~ 0*x3; x4 ~~ 0*x4; x5 ~~ 0*x5; x6 ~~ 0*x6
    y1 ~~ 0*y1; y2 ~~ 0*y2; y3 ~~ 0*y3; y4 ~~ 0*y4; y5 ~~ 0*y5; y6 ~~ 0*y6
y1 ~~ 0*x1; y2 ~~ 0*x2; y3 ~~ 0*x3; y4 ~~ 0*x4; y5 ~~ 0*x5; y6 ~~ 0*x6



FFy2 ~ betay*FFy1+gammay*FFx1
FFx2 ~ betax*FFx1+gammax*FFy1
FFy3 ~ betay*FFy2+gammay*FFx2
FFx3 ~ betax*FFx2+gammax*FFy2
FFy4 ~ betay*FFy3+gammay*FFx3
FFx4 ~ betax*FFx3+gammax*FFy3
FFy5 ~ betay*FFy4+gammay*FFx4
FFx5 ~ betax*FFx4+gammax*FFy4
FFy6 ~ betay*FFy5+gammay*FFx5
FFx6 ~ betax*FFx5+gammax*FFy5
FFx2 ~~ Omegax*FFx2
FFx3 ~~ Omegax*FFx3
FFx4 ~~ Omegax*FFx4
FFx5 ~~ Omegax*FFx5
FFx6 ~~ Omegax*FFx6
FFy2 ~~ Omegay*FFy2
FFy3 ~~ Omegay*FFy3
FFy4 ~~ Omegay*FFy4
FFy5 ~~ Omegay*FFy5
FFy6 ~~ Omegay*FFy6
FFx2 ~~ Omegaxy*FFy2
FFx3 ~~ Omegaxy*FFy3
FFx4 ~~ Omegaxy*FFy4
FFx5 ~~ Omegaxy*FFy5
FFx6 ~~ Omegaxy*FFy6
' 

## GCLx2(T=5) (AR(1)MA(1)CL(1)CLMA(1) model ####
#no correlations are assumed between initial states and accumulating factors. Because improper solutions were found, in this code non-stationarity is assumed for residual variance of X and residual covariance)
DF$GCLM2T5 <- '
x1~mux1*1; y1~muy1*1; x2~mux2*1; y2~muy2*1; x3~mux3*1; y3~muy3*1; x4~mux4*1; y4~muy4*1; x5~mux5*1; y5~muy5*1

FFy1 =~ 1*y1; FFy2 =~ 1*y2; FFy3 =~ 1*y3; FFy4 =~ 1*y4; FFy5 =~ 1*y5
FFx1 =~ 1*x1; FFx2 =~ 1*x2; FFx3 =~ 1*x3; FFx4 =~ 1*x4; FFx5 =~ 1*x5
By=~1*FFy1+1*FFy2+1*FFy3+1*FFy4+1*FFy5
Bx=~1*FFx1+1*FFx2+1*FFx3+1*FFx4+1*FFx5

dfx2=~1*FFx2+deltax*FFx3+zetay*FFy3
dfx3=~1*FFx3+deltax*FFx4+zetay*FFy4
dfx4=~1*FFx4+deltax*FFx5+zetay*FFy5
dfx5=~1*FFx5


dfy2=~1*FFy2+deltay*FFy3+zetax*FFx3
dfy3=~1*FFy3+deltay*FFy4+zetax*FFx4
dfy4=~1*FFy4+deltay*FFy5+zetax*FFx5
dfy5=~1*FFy5

FFx1~0*1; FFy1~0*1; Bx~0*1;By~0*1

FFx1~~phix1* FFx1; FFy1~~phiy1*FFy1; Bx~~phiBx*Bx;By~~phiBy*By
FFx1~~0*Bx; FFx1~~0*By; 
FFy1~~0*Bx; FFy1~~0*By; 
Bx~~phiBxBy*By
FFx1~~phix1y1* FFy1; 


x1 ~~ 0*x1; x2 ~~ 0*x2; x3 ~~ 0*x3; x4 ~~ 0*x4; x5 ~~ 0*x5
y1 ~~ 0*y1; y2 ~~ 0*y2; y3 ~~ 0*y3; y4 ~~ 0*y4; y5 ~~ 0*y5
y1 ~~ 0*x1; y2 ~~ 0*x2; y3 ~~ 0*x3; y4 ~~ 0*x4; y5 ~~ 0*x5



dfx2~0*1; dfx3~0*1; dfx4~0*1; dfx5~0*1
dfy2~0*1; dfy3~0*1; dfy4~0*1; dfy5~0*1

dfx2~~phix2*dfx2; dfx2~~phixy2*dfy2; dfy2~~phiy*dfy2;
dfx3~~phix3*dfx3; dfx3~~phixy3*dfy3; dfy3~~phiy*dfy3;
dfx4~~phix4*dfx4; dfx4~~phixy4*dfy4; dfy4~~phiy*dfy4;
dfx5~~phix5*dfx5; dfx5~~phixy5*dfy5; dfy5~~phiy*dfy5;


dfx2~~0*dfx3; dfx2~~0*dfy3; dfy2~~0*dfy3; dfy2~~0*dfx3;
dfx2~~0*dfx4; dfx2~~0*dfy4; dfy2~~0*dfy4; dfy2~~0*dfx4;
dfx2~~0*dfx5; dfx2~~0*dfy5; dfy2~~0*dfy5; dfy2~~0*dfx5;

dfx3~~0*dfx4; dfx3~~0*dfy4; dfy3~~0*dfy4; dfy3~~0*dfx4;
dfx3~~0*dfx5; dfx3~~0*dfy5; dfy3~~0*dfy5; dfy3~~0*dfx5;

dfx4~~0*dfx5; dfx4~~0*dfy5; dfy4~~0*dfy5; dfy4~~0*dfx5;

dfx2~~0*Bx; dfx2~~0*By; dfy2~~0*Bx; dfy2~~0*By;
dfx3~~0*Bx; dfx3~~0*By; dfy3~~0*Bx; dfy3~~0*By;
dfx4~~0*Bx; dfx4~~0*By; dfy4~~0*Bx; dfy4~~0*By;
dfx5~~0*Bx; dfx5~~0*By; dfy5~~0*Bx; dfy5~~0*By;

FFy1~~0*dfx2; FFy1~~0*dfx3; FFy1~~0*dfx4; FFy1~~0*dfx5
FFy1~~0*dfy2; FFy1~~0*dfy3; FFy1~~0*dfy4; FFy1~~0*dfy5
FFx1~~0*dfx2; FFx1~~0*dfx3; FFx1~~0*dfx4; FFx1~~0*dfx5
FFx1~~0*dfy2; FFx1~~0*dfy3; FFx1~~0*dfy4; FFx1~~0*dfy5

FFy2~ betay*FFy1+gammay*FFx1; FFx2~ betax*FFx1+gammax*FFy1
FFy3~ betay*FFy2+gammay*FFx2; FFx3~ betax*FFx2+gammax*FFy2
FFy4~ betay*FFy3+gammay*FFx3; FFx4~ betax*FFx3+gammax*FFy3
FFy5~ betay*FFy4+gammay*FFx4; FFx5~ betax*FFx4+gammax*FFy4

FFx2~~0*FFx2; FFx3~~0*FFx3; FFx4~~0*FFx4; FFx5~~0*FFx5
FFy2~~0*FFy2; FFy3~~0*FFy3; FFy4~~0*FFy4; FFy5~~0*FFy5
FFx2~~0*FFy2; FFx3~~0*FFy3; FFx4~~0*FFy4; FFx5~~0*FFy5
' 


## GCLx2(T=6) (AR(1)MA(1)CL(1)CLMA(1) model ####
#no correlations are assumed between initial states and accumulating factors. Because improper solutions were found, in this code non-stationarity is assumed for residual variance of X and residual covariance)
DF$GCLM2T6 <- '
x1~mux1*1; y1~muy1*1; x2~mux2*1; y2~muy2*1; x3~mux3*1; y3~muy3*1; x4~mux4*1; y4~muy4*1;
x5~mux5*1; y5~muy5*1; x6~mux6*1; y6~muy6*1

FFy1 =~ 1*y1; FFy2 =~ 1*y2; FFy3 =~ 1*y3; FFy4 =~ 1*y4; FFy5 =~ 1*y5; FFy6 =~ 1*y6
FFx1 =~ 1*x1; FFx2 =~ 1*x2; FFx3 =~ 1*x3; FFx4 =~ 1*x4; FFx5 =~ 1*x5; FFx6 =~ 1*x6
By=~1*FFy1+1*FFy2+1*FFy3+1*FFy4+1*FFy5+1*FFy6; Bx=~1*FFx1+1*FFx2+1*FFx3+1*FFx4+1*FFx5+1*FFx6

dfx2=~1*FFx2+deltax*FFx3+zetay*FFy3
dfx3=~1*FFx3+deltax*FFx4+zetay*FFy4
dfx4=~1*FFx4+deltax*FFx5+zetay*FFy5
dfx5=~1*FFx5+deltax*FFx6+zetay*FFy6
dfx6=~1*FFx6

dfy2=~1*FFy2+deltay*FFy3+zetax*FFx3
dfy3=~1*FFy3+deltay*FFy4+zetax*FFx4
dfy4=~1*FFy4+deltay*FFy5+zetax*FFx5
dfy5=~1*FFy5+deltay*FFy6+zetax*FFx6
dfy6=~1*FFy6

FFx1~0*1; FFy1~0*1; Bx~0*1;By~0*1

FFx1~~phix1* FFx1; FFy1~~phiy1*FFy1; Bx~~phiBx*Bx;By~~phiBy*By
FFx1~~0*Bx; FFx1~~0*By; 
FFy1~~0*Bx; FFy1~~0*By; 
Bx~~phiBxBy*By
FFx1~~phix1y1* FFy1; 


x1 ~~ 0*x1; x2 ~~ 0*x2; x3 ~~ 0*x3; x4 ~~ 0*x4; x5 ~~ 0*x5; x6 ~~ 0*x6
y1 ~~ 0*y1; y2 ~~ 0*y2; y3 ~~ 0*y3; y4 ~~ 0*y4; y5 ~~ 0*y5; y6 ~~ 0*y6
y1 ~~ 0*x1; y2 ~~ 0*x2; y3 ~~ 0*x3; y4 ~~ 0*x4; y5 ~~ 0*x5; y6 ~~ 0*x6



dfx2~0*1; dfx3~0*1; dfx4~0*1; dfx5~0*1; dfx6~0*1
dfy2~0*1; dfy3~0*1; dfy4~0*1; dfy5~0*1; dfy6~0*1

dfx2~~phix2*dfx2; dfx2~~phixy2*dfy2; dfy2~~phiy*dfy2;
dfx3~~phix3*dfx3; dfx3~~phixy3*dfy3; dfy3~~phiy*dfy3;
dfx4~~phix4*dfx4; dfx4~~phixy4*dfy4; dfy4~~phiy*dfy4;
dfx5~~phix5*dfx5; dfx5~~phixy5*dfy5; dfy5~~phiy*dfy5;
dfx6~~phix6*dfx6; dfx6~~phixy6*dfy6; dfy6~~phiy*dfy6;

dfx2~~0*dfx3; dfx2~~0*dfy3; dfy2~~0*dfy3; dfy2~~0*dfx3;
dfx2~~0*dfx4; dfx2~~0*dfy4; dfy2~~0*dfy4; dfy2~~0*dfx4;
dfx2~~0*dfx5; dfx2~~0*dfy5; dfy2~~0*dfy5; dfy2~~0*dfx5;
dfx2~~0*dfx6; dfx2~~0*dfy6; dfy2~~0*dfy6; dfy2~~0*dfx6;
dfx3~~0*dfx4; dfx3~~0*dfy4; dfy3~~0*dfy4; dfy3~~0*dfx4;
dfx3~~0*dfx5; dfx3~~0*dfy5; dfy3~~0*dfy5; dfy3~~0*dfx5;
dfx3~~0*dfx6; dfx3~~0*dfy6; dfy3~~0*dfy6; dfy3~~0*dfx6;
dfx4~~0*dfx5; dfx4~~0*dfy5; dfy4~~0*dfy5; dfy4~~0*dfx5;
dfx4~~0*dfx6; dfx4~~0*dfy6; dfy4~~0*dfy6; dfy4~~0*dfx6;
dfx5~~0*dfx6; dfx5~~0*dfy6; dfy5~~0*dfy6; dfy5~~0*dfx6;

dfx2~~0*Bx; dfx2~~0*By; dfy2~~0*Bx; dfy2~~0*By;
dfx3~~0*Bx; dfx3~~0*By; dfy3~~0*Bx; dfy3~~0*By;
dfx4~~0*Bx; dfx4~~0*By; dfy4~~0*Bx; dfy4~~0*By;
dfx5~~0*Bx; dfx5~~0*By; dfy5~~0*Bx; dfy5~~0*By;
dfx6~~0*Bx; dfx6~~0*By; dfy6~~0*Bx; dfy6~~0*By;

FFy1~~0*dfx2; FFy1~~0*dfx3; FFy1~~0*dfx4; FFy1~~0*dfx5; FFy1~~0*dfx6;
FFy1~~0*dfy2; FFy1~~0*dfy3; FFy1~~0*dfy4; FFy1~~0*dfy5; FFy1~~0*dfy6;
FFx1~~0*dfx2; FFx1~~0*dfx3; FFx1~~0*dfx4; FFx1~~0*dfx5; FFx1~~0*dfx6;
FFx1~~0*dfy2; FFx1~~0*dfy3; FFx1~~0*dfy4; FFx1~~0*dfy5; FFx1~~0*dfy6;

FFy2~ betay*FFy1+gammay*FFx1; FFx2~ betax*FFx1+gammax*FFy1
FFy3~ betay*FFy2+gammay*FFx2; FFx3~ betax*FFx2+gammax*FFy2
FFy4~ betay*FFy3+gammay*FFx3; FFx4~ betax*FFx3+gammax*FFy3
FFy5~ betay*FFy4+gammay*FFx4; FFx5~ betax*FFx4+gammax*FFy4
FFy6~ betay*FFy5+gammay*FFx5; FFx6~ betax*FFx5+gammax*FFy5
FFx2~~0*FFx2; FFx3~~0*FFx3; FFx4~~0*FFx4; FFx5~~0*FFx5; FFx6~~0*FFx6;
FFy2~~0*FFy2; FFy3~~0*FFy3; FFy4~~0*FFy4; FFy5~~0*FFy5; FFy6~~0*FFy6
FFx2~~0*FFy2; FFx3~~0*FFy3; FFx4~~0*FFy4; FFx5~~0*FFy5; FFx6~~0*FFy6
' 


## RI-CLPM 6 Wellen Constrained identisch mit USAMI ####
DF$riclpm6C <-
  '
#RANDOM INTERCEPTS
RIx =~ 1*x1 + 1*x2 + 1*x3 + 1*x4 + 1*x5 + 1*x6
RIy =~ 1*y1 + 1*y2 + 1*y3 + 1*y4 + 1*y5 + 1*y6

#LATENT FACTORS
Lx1 =~ 1*x1 #each factor loading set to 1
Lx2 =~ 1*x2 
Lx3 =~ 1*x3
Lx4 =~ 1*x4
Lx5 =~ 1*x5
Lx6 =~ 1*x6
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3
Ly4 =~ 1*y4
Ly5 =~ 1*y5
Ly6 =~ 1*y6

#VARIANCES @0 OF OBSERVED SCORES
x1 ~~ 0*x1
x2 ~~ 0*x2
x3 ~~ 0*x3
x4 ~~ 0*x4
x5 ~~ 0*x5
x6 ~~ 0*x6
y1 ~~ 0*y1
y2 ~~ 0*y2
y3 ~~ 0*y3
y4 ~~ 0*y4
y5 ~~ 0*y5
y6 ~~ 0*y6

#LATENT FACTORS COVARIANCES @0
RIx ~~ 0*Lx1
RIx ~~ 0*Ly1
RIy ~~ 0*Lx1
RIy ~~ 0*Ly1


#CORRELATIONS
RIx ~~ co00*RIy
Lx6 ~~ co02*Ly6
Lx5 ~~ co02*Ly5
Lx4 ~~ co02*Ly4
Lx3 ~~ co02*Ly3
Lx2 ~~ co02*Ly2
Lx1 ~~ co01*Ly1

#Latent Intercept (Redundant)
Lx1 ~ 0*1 
Lx2 ~ 0*1

#Latent Variance
Lx2 ~~ varM*Lx2; Ly2 ~~ varW*Ly2
Lx3 ~~ varM*Lx3; Ly3 ~~ varW*Ly3
Lx4 ~~ varM*Lx4; Ly4 ~~ varW*Ly4
Lx5 ~~ varM*Lx5; Ly5 ~~ varW*Ly5
Lx6 ~~ varM*Lx6; Ly6 ~~ varW*Ly6

#Stability & LAGGED EFFECTS
Lx6 ~ sp10*Lx5 + cl10*Ly5
Lx5 ~ sp10*Lx4 + cl10*Ly4
Lx4 ~ sp10*Lx3 + cl10*Ly3
Lx3 ~ sp10*Lx2 + cl10*Ly2
Lx2 ~ sp10*Lx1 + cl10*Ly1

Ly6 ~ sp20*Ly5 + cl20*Lx5
Ly5 ~ sp20*Ly4 + cl20*Lx4
Ly4 ~ sp20*Ly3 + cl20*Lx3
Ly3 ~ sp20*Ly2 + cl20*Lx2
Ly2 ~ sp20*Ly1 + cl20*Lx1'

# Zyphur ####
## GCLM 6 Wellen nach Zyphur ####
DF$z_gclmt6 <-
'#unit effects
eta_x =~ x6 + x5 + x4 + x3 + x2 + x1
eta_y =~ y6 + y5 + y4 + y3 + y2 + y1

#impulses
u_x1 =~ x1
x1 ~~ 0*x1
u_x2 =~ x2
x2 ~~ 0*x2
u_x3 =~ x3
x3 ~~ 0*x3
u_x4 =~ x4
x4 ~~ 0*x4
u_x5 =~ x5
x5 ~~ 0*x5
u_x6 =~ x6
x6 ~~ 0*x6
u_y1 =~ y1
y1 ~~ 0*y1
u_y2 =~ y2
y2 ~~ 0*y2
u_y3 =~ y3
y3 ~~ 0*y3
u_y4 =~ y4
y4 ~~ 0*y4
u_y5 =~ y5
y5 ~~ 0*y5
u_y6 =~ y6
y6 ~~ 0*y6

#regressions
x6 ~ a*x5 + b*y5 + c*u_x5 + d*u_y5 
x5 ~ a*x4 + b*y4 + c*u_x4 + d*u_y4 
x4 ~ a*x3 + b*y3 + c*u_x3 + d*u_y3 
x3 ~ a*x2 + b*y2 + c*u_x2 + d*u_y2 
x2 ~ a*x1 + b*y1 + c*u_x1 + d*u_y1 
y6 ~ f*x5 + g*y5 + h*u_x5 + i*u_y5 
y5 ~ f*x4 + g*y4 + h*u_x4 + i*u_y4 
y4 ~ f*x3 + g*y3 + h*u_x3 + i*u_y3 
y3 ~ f*x2 + g*y2 + h*u_x2 + i*u_y2 
y2 ~ f*x1 + g*y1 + h*u_x1 + i*u_y1 

#co-movements
u_x1 ~~ u_y1
u_x2 ~~ u_y2
u_x3 ~~ u_y3
u_x4 ~~ u_y4
u_x5 ~~ u_y5
u_x6 ~~ u_y6

#restrictions
u_x1 ~~ 0*eta_x + 0*eta_y + 0*u_x2 + 0*u_x3 + 0*u_x4 + 0*u_x5 + 0*u_x6 + 0*u_y2 + 0*u_y3 + 0*u_y4 + 0*u_y5 + 0*u_y6 
u_x2 ~~ 0*eta_x + 0*eta_y +  0*u_x3 + 0*u_x4 + 0*u_x5 + 0*u_x6 + 0*u_y1 + 0*u_y3 + 0*u_y4 + 0*u_y5 + 0*u_y6
u_x3 ~~ 0*eta_x + 0*eta_y +  0*u_x4 + 0*u_x5 + 0*u_x6 + 0*u_y1 + 0*u_y2 + 0*u_y4 + 0*u_y5 + 0*u_y6
u_x4 ~~ 0*eta_x + 0*eta_y + 0*u_x5 + 0*u_x6 + 0*u_y1 + 0*u_y2 + 0*u_y3 + 0*u_y5 + 0*u_y6
u_x5 ~~ 0*eta_x + 0*eta_y + 0*u_x6 + 0*u_y1 + 0*u_y2 + 0*u_y3 + 0*u_y4 + 0*u_y6
u_x6 ~~ 0*eta_x + 0*eta_y + 0*u_y1 + 0*u_y2 + 0*u_y3 + 0*u_y4 + 0*u_y5
u_y1 ~~ 0*eta_x + 0*eta_y + 0*u_y2 + 0*u_y3 + 0*u_y4 + 0*u_y5 + 0*u_y6 
u_y2 ~~ 0*eta_x + 0*eta_y + 0*u_y3 + 0*u_y4 + 0*u_y5 + 0*u_y6
u_y3 ~~ 0*eta_x + 0*eta_y + 0*u_y4 + 0*u_y5 + 0*u_y6
u_y4 ~~ 0*eta_x + 0*eta_y + 0*u_y5 + 0*u_y6
u_y5 ~~ 0*eta_x + 0*eta_y + 0*u_y6 
u_y6 ~~ 0*eta_x + 0*eta_y
'
## GCLM 5 Wellen nach Zyphur ####
DF$z_gclmt5 <-
  '#unit effects
eta_x =~ x5 + x4 + x3 + x2 + x1
eta_y =~ y5 + y4 + y3 + y2 + y1

#impulses
u_x1 =~ x1
x1 ~~ 0*x1
u_x2 =~ x2
x2 ~~ 0*x2
u_x3 =~ x3
x3 ~~ 0*x3
u_x4 =~ x4
x4 ~~ 0*x4
u_x5 =~ x5
x5 ~~ 0*x5
u_y1 =~ y1
y1 ~~ 0*y1
u_y2 =~ y2
y2 ~~ 0*y2
u_y3 =~ y3
y3 ~~ 0*y3
u_y4 =~ y4
y4 ~~ 0*y4
u_y5 =~ y5
y5 ~~ 0*y5

#regressions
x5 ~ a*x4 + b*y4 + c*u_x4 + d*u_y4 
x4 ~ a*x3 + b*y3 + c*u_x3 + d*u_y3 
x3 ~ a*x2 + b*y2 + c*u_x2 + d*u_y2 
x2 ~ a*x1 + b*y1 + c*u_x1 + d*u_y1 
y5 ~ f*x4 + g*y4 + h*u_x4 + i*u_y4 
y4 ~ f*x3 + g*y3 + h*u_x3 + i*u_y3 
y3 ~ f*x2 + g*y2 + h*u_x2 + i*u_y2 
y2 ~ f*x1 + g*y1 + h*u_x1 + i*u_y1 

#co-movements
u_x1 ~~ u_y1
u_x2 ~~ u_y2
u_x3 ~~ u_y3
u_x4 ~~ u_y4
u_x5 ~~ u_y5

#restrictions
u_x1 ~~ 0*eta_x + 0*eta_y + 0*u_x2 + 0*u_x3 + 0*u_x4 + 0*u_x5 + 0*u_y2 + 0*u_y3 + 0*u_y4 + 0*u_y5
u_x2 ~~ 0*eta_x + 0*eta_y +  0*u_x3 + 0*u_x4 + 0*u_x5 + 0*u_y1 + 0*u_y3 + 0*u_y4 + 0*u_y5
u_x3 ~~ 0*eta_x + 0*eta_y +  0*u_x4 + 0*u_x5 + 0*u_y1 + 0*u_y2 + 0*u_y4 + 0*u_y5
u_x4 ~~ 0*eta_x + 0*eta_y + 0*u_x5 + 0*u_y1 + 0*u_y2 + 0*u_y3 + 0*u_y5
u_x5 ~~ 0*eta_x + 0*eta_y + 0*u_y1 + 0*u_y2 + 0*u_y3 + 0*u_y4
u_y1 ~~ 0*eta_x + 0*eta_y + 0*u_y2 + 0*u_y3 + 0*u_y4 + 0*u_y5
u_y2 ~~ 0*eta_x + 0*eta_y + 0*u_y3 + 0*u_y4 + 0*u_y5
u_y3 ~~ 0*eta_x + 0*eta_y + 0*u_y4 + 0*u_y5
u_y4 ~~ 0*eta_x + 0*eta_y + 0*u_y5
u_y5 ~~ 0*eta_x + 0*eta_y
'
# Sakaluk ####
## GCLM  - 5 Wellen ####
DF$s_gcmlT5 <-
  '
#unit effects
eta_x =~ x1+x2+x3+x4+x5
eta_y =~ y1+y2+y3+y4+y5

#impulses
u_x1 =~ x1 
u_x2 =~ x2 
u_x3 =~ x3 
u_x4 =~ x4 
u_x5 =~ x5
x1 ~~ 0*x1 
x2 ~~ 0*x2 
x3 ~~ 0*x3 
x4 ~~ 0*x4 
x5 ~~ 0*x5
u_y1 =~ y1 
u_y2 =~ y2 
u_y3 =~ y3 
u_y4 =~ y4 
u_y5 =~ y5
y1 ~~ 0*y1 
y2 ~~ 0*y2 
y3 ~~ 0*y3 
y4 ~~ 0*y4 
y5 ~~ 0*y5

#regressions
x2 ~ a*x1 + b*y1 + c*u_x1 + d*u_y1 
x3 ~ a*x2 + b*y2 + c*u_x2 + d*u_y2 
x4 ~ a*x3 + b*y3 + c*u_x3 + d*u_y3 
x5 ~ a*x4 + b*y4 + c*u_x4 + d*u_y4
y2 ~ f*x1 + g*y1 + h*u_x1 + i*u_y1 
y3 ~ f*x2 + g*y2 + h*u_x2 + i*u_y2 
y4 ~ f*x3 + g*y3 + h*u_x3 + i*u_y3 
y5 ~ f*x4 + g*y4 + h*u_x4 + i*u_y4

#co-movements
u_x1 ~~ u_y1 
u_x2 ~~ u_y2 
u_x3 ~~ u_y3 
u_x4 ~~ u_y4 
u_x5 ~~ u_y5

#restrictions
u_x1 ~~ 0*eta_x + 0*eta_y + 0*u_x2+0*u_x3+0*u_x4+0*u_x5+0*u_y1+0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_x2 ~~ 0*eta_x + 0*eta_y + 0*u_x3+0*u_x4+0*u_x5+0*u_y1+0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_x3 ~~ 0*eta_x + 0*eta_y + 0*u_x4+0*u_x5+0*u_y1+0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_x4 ~~ 0*eta_x + 0*eta_y + 0*u_x5+0*u_y1+0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_x5 ~~ 0*eta_x + 0*eta_y + 0*u_y1+0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_y1 ~~ 0*eta_x + 0*eta_y + 0*u_y2+0*u_y3+0*u_y4+0*u_y5
u_y2 ~~ 0*eta_x + 0*eta_y + 0*u_y3+0*u_y4+0*u_y5
u_y3 ~~ 0*eta_x + 0*eta_y + 0*u_y4+0*u_y5
u_y4 ~~ 0*eta_x + 0*eta_y + 0*u_y5
u_y5 ~~ 0*eta_x + 0*eta_y  
'