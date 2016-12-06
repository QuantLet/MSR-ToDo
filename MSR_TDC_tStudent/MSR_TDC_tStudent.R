# ---------------------------------------------------------------------
# Book:         
# ---------------------------------------------------------------------
# Quantlet:     MSR_TDC_tStudent
# ---------------------------------------------------------------------
# Description:  MSR_TDC_tStudent plots the tail dependence coefficient
#               of t-Student copula as the function of correlation and
#               the number of degrees of freedom.
# ---------------------------------------------------------------------
# Usage:        MSR_TDC_tStudent
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       Plot of the tail dependence coefficient of t-Student 
#               copula.
# ---------------------------------------------------------------------
# Example:     
# ---------------------------------------------------------------------
# Author:       Zografia Anastasiadou, 20110601
# ---------------------------------------------------------------------
rm(list = ls(all = TRUE))
# setwd('C:/...')

install.packages("lattice")
library(lattice)

d = 3:103
r = seq(-1, 1, by = 0.02)
m = length(d)
n = length(r)
D = matrix(rep(d, each = n), nrow = n)
R = matrix(rep(r, m), nrow = n)

x = t(R)
y = t(D)
N = length(x)

t = 2 - 2 * pt(sqrt(y + 1) * sqrt(1 - x)/sqrt(1 + x), y + 1)

s = expand.grid(d = d, r = r) 

wireframe(t ~ d*d, s, shade = TRUE, xlab = "Degrees of Freedom",
    ylab = "Correlation", zlab = "Tail Dep Coef", 
    main = "Tail Dependence Coefficient for t-Student Copula", 
    scales = list(arrows = FALSE))
