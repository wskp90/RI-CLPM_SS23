# 3-Wellen RICLPM Unconstrained####
# Isabelle Hansson, Department of Psychology, University of Gothenburg, Sweden/Flournoy

# CLPModell Defintion unconsrained ####
DF$clpm <-
  '
#Resiudal Correlation
w1_med ~~ co01*w1_wis
w2_med ~~ co02*w2_wis
w3_med ~~ co03*w3_wis

#Stability & Crosslagged Paths
w2_med ~ co05*w1_med + co09*w1_wis
w3_med ~ co06*w2_med + co10*w2_wis
w2_wis ~ co07*w1_wis + co11*w1_med
w3_wis ~ co08*w2_wis + co12*w2_med'



DF$riclpm <-
  '
#RANDOM INTERCEPTS
RI_med =~ 1*w1_med + 1*w2_med + 1*w3_med
RI_wis =~ 1*w1_wis + 1*w2_wis + 1*w3_wis

#LATENT FACTORS
L1_med =~ 1*w1_med #each factor loading set to 1
L2_med =~ 1*w2_med 
L3_med =~ 1*w3_med
L1_wis =~ 1*w1_wis
L2_wis =~ 1*w2_wis
L3_wis =~ 1*w3_wis

#VARIANCES @0 OF OBSERVED SCORES
w1_med ~~ 0*w1_med
w2_med ~~ 0*w2_med
w3_med ~~ 0*w3_med
w1_wis ~~ 0*w1_wis
w2_wis ~~ 0*w2_wis
w3_wis ~~ 0*w3_wis

#LATENT FACTORS COVARIANCES @0
RI_med ~~ 0*L1_med
RI_med ~~ 0*L1_wis
RI_wis ~~ 0*L1_med
RI_wis ~~ 0*L1_wis

#CORRELATIONS
L1_med ~~ co01*L1_wis
L2_med ~~ co02*L2_wis
L3_med ~~ co03*L3_wis
RI_med ~~ co04*RI_wis

#Stability & LAGGED EFFECTS
L2_med ~ sp05*L1_med + cl09*L1_wis
L3_med ~ sp06*L2_med + cl10*L2_wis
L2_wis ~ sp07*L1_wis + cl11*L1_med
L3_wis ~ sp08*L2_wis + cl12*L2_med'
