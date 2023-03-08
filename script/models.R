# Isabelle Hansson, Department of Psychology, University of Gothenburg, Sweden/Flournoy

# CLPModell 3 Wellen Defintion unconsrained ####
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
LM2 ~ co05*LM1 + co09*LW1
LM3 ~ co06*LM2 + co10*LW2
LW2 ~ co07*LW1 + co11*LM1
LW3 ~ co08*LW2 + co12*LM2
'
# CLPModell 4 Wellen Defintion unconsrained ####
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
LM2 ~ ar11*LM1 + cc11*LW1
LM3 ~ ar12*LM2 + cc12*LW2
LM4 ~ ar13*LM3 + cc13*LW3
LW2 ~ ar21*LW1 + cc21*LM1
LW3 ~ ar22*LW2 + cc22*LM2
LW4 ~ ar23*LW3 + cc23*LM3
'
# RI-CLPModell 3 Wellen Defintion unconsrained ####
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
LM1 ~~ co01*LW1
LM2 ~~ co02*LW2
LM3 ~~ co03*LW3
RIM ~~ co04*RIW

#Stability & LAGGED EFFECTS
LM2 ~ sp05*LM1 + cl09*LW1
LM3 ~ sp06*LM2 + cl10*LW2
LW2 ~ sp07*LW1 + cl11*LM1
LW3 ~ sp08*LW2 + cl12*LM2
'
# RI-CLPModell 4 Wellen Definition unconstrained ####
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
LM1 ~~ co01*LW1
LM2 ~~ co02*LW2
LM3 ~~ co03*LW3
LM4 ~~ co04*LW4
RIM ~~ co00*RIW

#Stability & LAGGED EFFECTS
LM2 ~ sp11*LM1 + cc11*LW1
LM3 ~ sp12*LM2 + cc12*LW2
LM4 ~ sp13*LM3 + cc13*LW3
LW2 ~ sp21*LW1 + cc21*LM1
LW3 ~ sp22*LW2 + cc22*LM2
LW4 ~ sp23*LW3 + cc23*LM3'

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
LM2 ~ ar11*LM1 + cc11*LW1
LM3 ~ ar12*LM2 + cc12*LW2
LM4 ~ ar13*LM3 + cc13*LW3
LM5 ~ ar14*LM4 + cc14*LW4

LW2 ~ ar21*LW1 + cc21*LM1
LW3 ~ ar22*LW2 + cc22*LM2
LW4 ~ ar23*LW3 + cc23*LM3
LW5 ~ ar24*LW4 + cc24*LM4
'
# RI-CLPModell 5 Wellen Definition unconstrained ####
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
LM1 ~~ co01*LW1
LM2 ~~ co02*LW2
LM3 ~~ co03*LW3
LM4 ~~ co04*LW4
LM4 ~~ co05*LW4
RIM ~~ co00*RIW

#Stability & LAGGED EFFECTS
LM2 ~ sp11*LM1 + cc11*LW1
LM3 ~ sp12*LM2 + cc12*LW2
LM4 ~ sp13*LM3 + cc13*LW3
LM5 ~ sp14*LM4 + cc14*LW4

LW2 ~ sp21*LW1 + cc21*LM1
LW3 ~ sp22*LW2 + cc22*LM2
LW4 ~ sp23*LW3 + cc23*LM3
LW5 ~ sp24*LW4 + cc24*LM4'
