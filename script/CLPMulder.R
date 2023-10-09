# Jeroen D. Mulder: https://jeroendmulder.github.io/RI-CLPM/lavaan.html
# 3 Waves ####
## unconstrained ####
DF$modef$cl$m3u <- '
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

## constrained  ####
DF$modef$cl$m3c <- '
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

## unconstrained Mulder 2 Lags ####
DF$modef$cl$m3ul2 <- '
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

# 4 Waves
## unconstrained ####
DF$modef$cl$m4u <- '
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

## constrained  ####
DF$modef$cl$m4c <- '
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

# 5 Waves ####
## unconstrained ####
DF$modef$cl$m5u <- '
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

## constrained  ####
DF$modef$cl$m5c <- '
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

# 6 Waves ####
## unconstrained ####
DF$modef$cl$m6u <-'
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
## constrained  ####
DF$modef$cl$m6c <- '
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
