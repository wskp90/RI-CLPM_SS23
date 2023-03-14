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
