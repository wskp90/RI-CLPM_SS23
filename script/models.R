# 3-Wellen RICLPM Unconstrained####
# Isabelle Hansson, Department of Psychology, University of Gothenburg, Sweden/Flournoy

# CLPModell Defintion unconsrained ####
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
