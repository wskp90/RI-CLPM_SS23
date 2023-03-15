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



FFy2~ betay*FFy1+gammay*FFx1; FFx2~ betax*FFx1+gammax*FFy1
    FFy3~ betay*FFy2+gammay*FFx2; FFx3~ betax*FFx2+gammax*FFy2
    FFy4~ betay*FFy3+gammay*FFx3; FFx4~ betax*FFx3+gammax*FFy3
    FFy5~ betay*FFy4+gammay*FFx4; FFx5~ betax*FFx4+gammax*FFy4
    FFy6~ betay*FFy5+gammay*FFx5; FFx6~ betax*FFx5+gammax*FFy5
    FFx2~~Omegax*FFx2; FFx3~~Omegax*FFx3; FFx4~~Omegax*FFx4; FFx5~~Omegax*FFx5; FFx6~~Omegax*FFx6;
    FFy2~~Omegay*FFy2; FFy3~~Omegay*FFy3; FFy4~~Omegay*FFy4; FFy5~~Omegay*FFy5; FFy6~~Omegay*FFy6
    FFx2~~Omegaxy*FFy2; FFx3~~Omegaxy*FFy3; FFx4~~Omegaxy*FFy4; FFx5~~Omegaxy*FFy5; FFx6~~Omegaxy*FFy6
' 

## GCLM2(T=6) (AR(1)MA(1)CL(1)CLMA(1) model ####
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
