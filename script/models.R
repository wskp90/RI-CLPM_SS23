# Isabelle Hansson, Department of Psychology, University of Gothenburg, Sweden/Flournoy

# CLPModell 3 Wellen Definition unconstrained ####
DF$clpm <-
'
#Resiudal Correlation
m1 ~~ co01*w1
m2 ~~ co02*w2
m3 ~~ co03*w3

#Stability & Crosslagged Paths
m2 ~ co05*m1 + co09*w1
m3 ~ co06*m2 + co10*w2
w2 ~ co07*w1 + co11*m1
w3 ~ co08*w2 + co12*m2'

DF$clpm_L <-
'
#LATENT FACTORS
LM1 =~ 1*m1 #each factor loading set to 1
LM2 =~ 1*m2 
LM3 =~ 1*m3
LW1 =~ 1*w1
LW2 =~ 1*w2
LW3 =~ 1*w3

#Resiudal Correlation
LM1 ~~ co01*LW1
LM2 ~~ co02*LW2
LM3 ~~ co03*LW3

#Stability & Crosslagged Paths
LM3 ~ sp12*LM2 + cl12*LW2
LM2 ~ sp11*LM1 + cl11*LW1

LW3 ~ sp22*LW2 + cl22*LM2
LW2 ~ sp21*LW1 + cl21*LM1
'
# # CLPModell 4 Wellen Definition unconstrained 2 Lags
DF$clpm_L2 <-
  '
#LATENT FACTORS
LM1 =~ 1*m1 #each factor loading set to 1
LM2 =~ 1*m2 
LM3 =~ 1*m3
LW1 =~ 1*w1
LW2 =~ 1*w2
LW3 =~ 1*w3

#Resiudal Correlation
LM1 ~~ co01*LW1
LM2 ~~ co02*LW2
LM3 ~~ co03*LW3

#Stability & Crosslagged Paths
LM3 ~ sp12*LM2 + sp13*LM1 + cl12*LW2 + cl13*LW1
LM2 ~ sp11*LM1 + cl11*LW1

LW3 ~ sp22*LW2 + sp23*LW1 + cl22*LM2 + cl23*LM1
LW2 ~ sp21*LW1 + cl21*LM1
'
# GCML ###
DF$gcml <-
'
#unit effects
eta_x =~ m1+m2+m3
eta_y =~ w1+w2+w3

#impulses
u_x1 =~ m1 
u_x2 =~ m2 
u_x3 =~ m3
m1 ~~ 0*m1 
m2 ~~ 0*m2 
m3 ~~ 0*m3
u_y1 =~ w1 
u_y2 =~ w2 
u_y3 =~ w3
w1 ~~ 0*w1 
w2 ~~ 0*w2 
w3 ~~ 0*w3

#regressions
m2 ~ a*m1 + b*w1 + c*u_x1 + d*u_y1 
m3 ~ a*m2 + b*w2 + c*u_x2 + d*u_y2
w2 ~ f*m1 + g*w1 + h*u_x1 + i*u_y1 
w3 ~ f*m2 + g*w2 + h*u_x2 + i*u_y2

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



# CLPModell 4 Wellen Definition unconstrained ####
DF$clpm_L4 <-
  '
#LATENT FACTORS
LM1 =~ 1*m1 #each factor loading set to 1
LM2 =~ 1*m2 
LM3 =~ 1*m3
LM4 =~ 1*m4
LW1 =~ 1*w1
LW2 =~ 1*w2
LW3 =~ 1*w3
LW4 =~ 1*w4

#Resiudal Correlation
LM1 ~~ co01*LW1
LM2 ~~ co02*LW2
LM3 ~~ co03*LW3
LM4 ~~ co04*LW4

#Stability & Crosslagged Paths
LM4 ~ ar13*LM3 + cl13*LW3
LM3 ~ ar12*LM2 + cl12*LW2
LM2 ~ ar11*LM1 + cl11*LW1

LW4 ~ ar23*LW3 + cl23*LM3
LW3 ~ ar22*LW2 + cl22*LM2
LW2 ~ ar21*LW1 + cl21*LM1
'
# CLPModell 5 Wellen Definition unconstrained ####
DF$clpm_L5 <-
  '
#LATENT FACTORS
LM1 =~ 1*m1 #each factor loading set to 1
LM2 =~ 1*m2 
LM3 =~ 1*m3
LM4 =~ 1*m4
LM5 =~ 1*m5
LW1 =~ 1*w1
LW2 =~ 1*w2
LW3 =~ 1*w3
LW4 =~ 1*w4
LW5 =~ 1*w5

#Resiudal Correlation
LM1 ~~ co01*LW1
LM2 ~~ co02*LW2
LM3 ~~ co03*LW3
LM4 ~~ co04*LW4
LM5 ~~ co04*LW5

#Stability & Crosslagged Paths
LM5 ~ ar14*LM4 + cl14*LW4
LM4 ~ ar13*LM3 + cl13*LW3
LM3 ~ ar12*LM2 + cl12*LW2
LM2 ~ ar11*LM1 + cl11*LW1

LW5 ~ ar24*LW4 + cl24*LM4
LW4 ~ ar23*LW3 + cl23*LM3
LW3 ~ ar22*LW2 + cl22*LM2
LW2 ~ ar21*LW1 + cl21*LM1
'

# CLPModell 5 Wellen Definition constrained ####
DF$clpm_L5C <-
  '
#LATENT FACTORS
LM1 =~ 1*m1 #each factor loading set to 1
LM2 =~ 1*m2 
LM3 =~ 1*m3
LM4 =~ 1*m4
LM5 =~ 1*m5
LW1 =~ 1*w1
LW2 =~ 1*w2
LW3 =~ 1*w3
LW4 =~ 1*w4
LW5 =~ 1*w5

#Resiudal Correlation
LM1 ~~ co00*LW1
LM2 ~~ co00*LW2
LM3 ~~ co00*LW3
LM4 ~~ co00*LW4
LM5 ~~ co00*LW5

#Stability & Crosslagged Paths
LM5 ~ ar10*LM4 + cl10*LW4
LM4 ~ ar10*LM3 + cl10*LW3
LM3 ~ ar10*LM2 + cl10*LW2
LM2 ~ ar10*LM1 + cl10*LW1

LW5 ~ ar20*LW4 + cl20*LM4
LW4 ~ ar20*LW3 + cl20*LM3
LW3 ~ ar20*LW2 + cl20*LM2
LW2 ~ ar20*LW1 + cl20*LM1
'
# GCLM ####
## GCLM 5 Wellen Code von Sakaluk https://github.com/jsakaluk ####
DF$gclm5 <-
  '
eta_x =~ m1+m2+m3+m4+m5
eta_y =~ w1+w2+w3+w4+w5
#unit effects

#impulses
u_x1 =~ m1 
u_x2 =~ m2 
u_x3 =~ m3 
u_x4 =~ m4 
u_x5 =~ m5
m1 ~~ 0*m1 
m2 ~~ 0*m2 
m3 ~~ 0*m3 
m4 ~~ 0*m4 
m5 ~~ 0*m5
u_y1 =~ w1 
u_y2 =~ w2 
u_y3 =~ w3 
u_y4 =~ w4 
u_y5 =~ w5
w1 ~~ 0*w1 
w2 ~~ 0*w2 
w3 ~~ 0*w3 
w4 ~~ 0*w4 
w5 ~~ 0*w5

#regressions
m2 ~ a*m1 + b*w1 + c*u_x1 + d*u_y1 
m3 ~ a*m2 + b*w2 + c*u_x2 + d*u_y2 
m4 ~ a*m3 + b*w3 + c*u_x3 + d*u_y3 
m5 ~ a*m4 + b*w4 + c*u_x4 + d*u_y4
w2 ~ f*m1 + g*w1 + h*u_x1 + i*u_y1 
w3 ~ f*m2 + g*w2 + h*u_x2 + i*u_y2 
w4 ~ f*m3 + g*w3 + h*u_x3 + i*u_y3 
w5 ~ f*m4 + g*w4 + h*u_x4 + i*u_y4

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

#  RICLPM ####
## RI-CLPModell 3 Wellen Definition uncontsrained ####
DF$riclpm <-
'
#RANDOM INTERCEPTS
RIM =~ 1*m1 + 1*m2 + 1*m3
RIW =~ 1*w1 + 1*w2 + 1*w3

#LATENT FACTORS
LM1 =~ 1*m1 #each factor loading set to 1
LM2 =~ 1*m2 
LM3 =~ 1*m3
LW1 =~ 1*w1
LW2 =~ 1*w2
LW3 =~ 1*w3

#VARIANCES @0 OF OBSERVED SCORES
m1 ~~ 0*m1
m2 ~~ 0*m2
m3 ~~ 0*m3
w1 ~~ 0*w1
w2 ~~ 0*w2
w3 ~~ 0*w3

#LATENT FACTORS COVARIANCES @0
RIM ~~ 0*LM1
RIM ~~ 0*LW1
RIW ~~ 0*LM1
RIW ~~ 0*LW1

#CORRELATIONS
LM3 ~~ co03*LW3
LM2 ~~ co02*LW2
LM1 ~~ co01*LW1
RIM ~~ co04*RIW

#Stability & LAGGED EFFECTS
LM3 ~ sp06*LM2 + cl10*LW2
LM2 ~ sp05*LM1 + cl09*LW1

LW3 ~ sp08*LW2 + cl12*LM2
LW2 ~ sp07*LW1 + cl11*LM1
'
## RI-CLPModell 4 Wellen Definition unconstrained ####
DF$riclpm4 <-
  '
#RANDOM INTERCEPTS
RIM =~ 1*m1 + 1*m2 + 1*m3 + 1*m4
RIW =~ 1*w1 + 1*w2 + 1*w3 + 1*w4

#LATENT FACTORS
LM1 =~ 1*m1 #each factor loading set to 1
LM2 =~ 1*m2 
LM3 =~ 1*m3
LM4 =~ 1*m4
LW1 =~ 1*w1
LW2 =~ 1*w2
LW3 =~ 1*w3
LW4 =~ 1*w4

#VARIANCES @0 OF OBSERVED SCORES
m1 ~~ 0*m1
m2 ~~ 0*m2
m3 ~~ 0*m3
m4 ~~ 0*m4
w1 ~~ 0*w1
w2 ~~ 0*w2
w3 ~~ 0*w3
w4 ~~ 0*w4

#LATENT FACTORS COVARIANCES @0
RIM ~~ 0*LM1
RIM ~~ 0*LW1
RIW ~~ 0*LM1
RIW ~~ 0*LW1

#CORRELATIONS
LM4 ~~ co04*LW4
LM3 ~~ co03*LW3
LM2 ~~ co02*LW2
LM1 ~~ co01*LW1
RIM ~~ co00*RIW

#Stability & LAGGED EFFECTS
LM4 ~ sp13*LM3 + cl13*LW3
LM3 ~ sp12*LM2 + cl12*LW2
LM2 ~ sp11*LM1 + cl11*LW1

LW4 ~ sp23*LW3 + cl23*LM3
LW3 ~ sp22*LW2 + cl22*LM2
LW2 ~ sp21*LW1 + cl21*LM1
'

## RI-CLPModell 5 Wellen Definition unconstrained ####
DF$riclpm5 <-
'
#RANDOM INTERCEPTS
RIM =~ 1*m1 + 1*m2 + 1*m3 + 1*m4 + 1*m5
RIW =~ 1*w1 + 1*w2 + 1*w3 + 1*w4 + 1*w5

#LATENT FACTORS
LM1 =~ 1*m1 #each factor loading set to 1
LM2 =~ 1*m2 
LM3 =~ 1*m3
LM4 =~ 1*m4
LM5 =~ 1*m5
LW1 =~ 1*w1
LW2 =~ 1*w2
LW3 =~ 1*w3
LW4 =~ 1*w4
LW5 =~ 1*w5

#VARIANCES @0 OF OBSERVED SCORES
m1 ~~ 0*m1
m2 ~~ 0*m2
m3 ~~ 0*m3
m4 ~~ 0*m4
m5 ~~ 0*m5
w1 ~~ 0*w1
w2 ~~ 0*w2
w3 ~~ 0*w3
w4 ~~ 0*w4
w5 ~~ 0*w5

#LATENT FACTORS COVARIANCES @0
RIM ~~ 0*LM1
RIM ~~ 0*LW1
RIW ~~ 0*LM1
RIW ~~ 0*LW1

#CORRELATIONS
RIM ~~ co00*RIW
LM5 ~~ co05*LW5
LM4 ~~ co04*LW4
LM3 ~~ co03*LW3
LM2 ~~ co02*LW2
LM1 ~~ co01*LW1

#Stability & LAGGED EFFECTS
LM5 ~ sp14*LM4 + cl14*LW4
LM4 ~ sp13*LM3 + cl13*LW3
LM3 ~ sp12*LM2 + cl12*LW2
LM2 ~ sp11*LM1 + cl11*LW1

LW5 ~ sp24*LW4 + cl24*LM4
LW3 ~ sp22*LW2 + cl22*LM2
LW4 ~ sp23*LW3 + cl23*LM3
LW2 ~ sp21*LW1 + cl21*LM1
'


## RI-CLPModell 5 Wellen Definition constrained ####
DF$riclpm5C <-
'
#RANDOM INTERCEPTS
RIM =~ 1*m1 + 1*m2 + 1*m3 + 1*m4 + 1*m5
RIW =~ 1*w1 + 1*w2 + 1*w3 + 1*w4 + 1*w5

#LATENT FACTORS
LM1 =~ 1*m1 #each factor loading set to 1
LM2 =~ 1*m2 
LM3 =~ 1*m3
LM4 =~ 1*m4
LM5 =~ 1*m5
LW1 =~ 1*w1
LW2 =~ 1*w2
LW3 =~ 1*w3
LW4 =~ 1*w4
LW5 =~ 1*w5

#VARIANCES @0 OF OBSERVED SCORES
m1 ~~ 0*m1
m2 ~~ 0*m2
m3 ~~ 0*m3
m4 ~~ 0*m4
m5 ~~ 0*m5
w1 ~~ 0*w1
w2 ~~ 0*w2
w3 ~~ 0*w3
w4 ~~ 0*w4
w5 ~~ 0*w5

#LATENT FACTORS COVARIANCES @0
RIM ~~ 0*LM1
RIM ~~ 0*LW1
RIW ~~ 0*LM1
RIW ~~ 0*LW1

#CORRELATIONS
RIM ~~ co00*RIW
LM5 ~~ co01*LW5
LM4 ~~ co01*LW4
LM3 ~~ co01*LW3
LM2 ~~ co01*LW2
LM1 ~~ co01*LW1

#Stability & LAGGED EFFECTS
LM5 ~ sp10*LM4 + cl10*LW4
LM4 ~ sp10*LM3 + cl10*LW3
LM3 ~ sp10*LM2 + cl10*LW2
LM2 ~ sp10*LM1 + cl10*LW1

LW5 ~ sp20*LW4 + cl20*LM4
LW4 ~ sp20*LW3 + cl20*LM3
LW3 ~ sp20*LW2 + cl20*LM2
LW2 ~ sp20*LW1 + cl20*LM1'

# Usami ####
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
## RI-CLPM 6 Wellen Constrained identisch mit USAMI ####
DF$riclpm6C <-
  '
#RANDOM INTERCEPTS
RIM =~ 1*m1 + 1*m2 + 1*m3 + 1*m4 + 1*m5 + 1*m6
RIW =~ 1*w1 + 1*w2 + 1*w3 + 1*w4 + 1*w5 + 1*w6

#LATENT FACTORS
LM1 =~ 1*m1 #each factor loading set to 1
LM2 =~ 1*m2 
LM3 =~ 1*m3
LM4 =~ 1*m4
LM5 =~ 1*m5
LM6 =~ 1*m6
LW1 =~ 1*w1
LW2 =~ 1*w2
LW3 =~ 1*w3
LW4 =~ 1*w4
LW5 =~ 1*w5
LW6 =~ 1*w6

#VARIANCES @0 OF OBSERVED SCORES
m1 ~~ 0*m1
m2 ~~ 0*m2
m3 ~~ 0*m3
m4 ~~ 0*m4
m5 ~~ 0*m5
m6 ~~ 0*m6
w1 ~~ 0*w1
w2 ~~ 0*w2
w3 ~~ 0*w3
w4 ~~ 0*w4
w5 ~~ 0*w5
w6 ~~ 0*w6

#LATENT FACTORS COVARIANCES @0
RIM ~~ 0*LM1
RIM ~~ 0*LW1
RIW ~~ 0*LM1
RIW ~~ 0*LW1


#CORRELATIONS
RIM ~~ co00*RIW
LM6 ~~ co02*LW6
LM5 ~~ co02*LW5
LM4 ~~ co02*LW4
LM3 ~~ co02*LW3
LM2 ~~ co02*LW2
LM1 ~~ co01*LW1

#Latent Intercept (Redundant)
LM1 ~ 0*1 
LM2 ~ 0*1

#Latent Variance
LM2 ~~ varM*LM2; LW2 ~~ varW*LW2
LM3 ~~ varM*LM3; LW3 ~~ varW*LW3
LM4 ~~ varM*LM4; LW4 ~~ varW*LW4
LM5 ~~ varM*LM5; LW5 ~~ varW*LW5
LM6 ~~ varM*LM6; LW6 ~~ varW*LW6

#Stability & LAGGED EFFECTS
LM6 ~ sp10*LM5 + cl10*LW5
LM5 ~ sp10*LM4 + cl10*LW4
LM4 ~ sp10*LM3 + cl10*LW3
LM3 ~ sp10*LM2 + cl10*LW2
LM2 ~ sp10*LM1 + cl10*LW1

LW6 ~ sp20*LW5 + cl20*LM5
LW5 ~ sp20*LW4 + cl20*LM4
LW4 ~ sp20*LW3 + cl20*LM3
LW3 ~ sp20*LW2 + cl20*LM2
LW2 ~ sp20*LW1 + cl20*LM1'

