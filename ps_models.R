# Isabelle Hansson, Department of Psychology, University of Gothenburg, Sweden/Flournoy

## CLPModell 3 Wellen unconstrained for Groups ####
clpm_L <-
  '
#LATENT FACTORS
Lx1 =~ 1*x1 #each factor loading set to 1
Lx2 =~ 1*x2 
Lx3 =~ 1*x3
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3

#Resiudal Correlation
Lx1 ~~ Ly1
Lx2 ~~ Ly2
Lx3 ~~ Ly3

#Stability & Crosslagged Paths
Lx3 ~ Lx2 + Ly2
Lx2 ~ Lx1 + Ly1

Ly3 ~ Ly2 + Lx2
Ly2 ~ Ly1 + Lx1
'
## RI-CLPModell 3 Wellen uncontsrained for Groups ####
riclpm <-
  '
#RANDOM INTERCEPTS
RIx =~ 1*x1 + 1*x2 + 1*x3
RIy =~ 1*y1 + 1*y2 + 1*y3

#LATENT FACTORS
Lx1 =~ 1*x1 #each factor loading set to 1
Lx2 =~ 1*x2 
Lx3 =~ 1*x3
Ly1 =~ 1*y1
Ly2 =~ 1*y2
Ly3 =~ 1*y3

#VARIANCES @0 OF OBSERVED SCORES
x1 ~~ 0*x1
x2 ~~ 0*x2
x3 ~~ 0*x3
y1 ~~ 0*y1
y2 ~~ 0*y2
y3 ~~ 0*y3

#LATENT FACTORS COVARIANCES @0
RIx ~~ 0*Lx1
RIx ~~ 0*Ly1
RIy ~~ 0*Lx1
RIy ~~ 0*Ly1

#CORRELATIONS
Lx3 ~~ Ly3
Lx2 ~~ Ly2
Lx1 ~~ Ly1
RIx ~~ RIy

#Stability & LAGGED EFFECTS
Lx3 ~ Lx2 + Ly2
Lx2 ~ Lx1 + Ly1

Ly3 ~ Ly2 + Lx2
Ly2 ~ Ly1 + Lx1
'