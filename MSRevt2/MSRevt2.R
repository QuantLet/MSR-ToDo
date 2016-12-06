# ---------------------------------------------------------------------
# Book:         
# ---------------------------------------------------------------------
# Quantlet:     MSRevt2
# ---------------------------------------------------------------------
# Description:  MSRevt3 generates CDFs for normal distribution of a 
#               pseudo random variable with extreme value (Gumbel, 
#               Frechet and Weibull) and a random normal distributed 
#               variable.   
# ---------------------------------------------------------------------
# Usage:        MSRevt2
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       PP plot.
# ---------------------------------------------------------------------
# Example:     
# ---------------------------------------------------------------------
# Author:       Zografia Anastasiadou 20110401
# ---------------------------------------------------------------------

rm(list = ls(all = TRUE))
setwd("C:/...")

install.packages("evd")
library(evd)

set.seed(123)
n  =  100

# Gumbel
gumb1  =  rgev(n)
gumb2  =  sort(gumb1)
gumb   =  pnorm(gumb2)
t      =  c(1:n)/(n + 1)
dat    =  cbind(t, t)

plot(gumb, t, col = "blue", pch = 20, xlab = "", ylab = "", 
    main = "PP Plot of Extreme Value - Gumbel")
lines(dat, col = "red", lwd = 3)

alpha  =  0.5

# Frechet
frec1  =  rgev(n, 1, alpha, alpha)
frec2  =  sort(frec1)
frec   =  pnorm(frec2)
t      =  c(1:n)/(n + 1)
dat    =  cbind(t, t)

plot(frec, t, col = "blue", pch = 20, xlim = c(0, 1), ylim = c(0, 1), xlab = "", ylab = "", main = "PP Plot of Extreme Value - Frechet")
lines(dat, col = "red", lwd = 3)

# Weibull
weib1  =  rgev(n, -1, alpha, -alpha)
weib2  =  sort(weib1)
weib   =  pnorm(weib2)
t      =  c(1:n)/(n + 1)
dat    =  cbind(t, t)

plot(weib, t, col = "blue", pch = 20, xlim = c(0, 1), ylim = c(0, 1), 
    xlab = "", ylab = "", main = "PP Plot of Extreme Value - Weibull") 
lines(dat, col = "red", lwd = 3)