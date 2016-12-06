# ---------------------------------------------------------------------
# Book:        
# ---------------------------------------------------------------------
# Quantlet:     MSRevt3
# ---------------------------------------------------------------------
# Description:  MSRevt3 produces a PP plot of the pseudo random 
#               variables with Gumbel distribution against theoretical
#               Gumbel distribution.
# ---------------------------------------------------------------------
# Usage:        MSRevt3
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       PP plot.
# ---------------------------------------------------------------------
# Example:      -
# ---------------------------------------------------------------------
# Author:       Zografia Anastasiadou 20110401
# ---------------------------------------------------------------------


rm(list = ls(all = TRUE))
setwd("C:/...")

install.packages("evd")
library(evd)

set.seed(123)
n    = 150
xf1  = rgumbel(n)
xf   = sort(xf1)
t    = c(1:n)/(n + 1)
dat  = cbind(pgumbel(xf), t)
dat2 = cbind(t, t)

plot(dat, col = "blue", pch = 20, xlab = "", ylab = "", main = "CDFs of Random Variables") 
lines(dat2, col = "red", lwd = 3)