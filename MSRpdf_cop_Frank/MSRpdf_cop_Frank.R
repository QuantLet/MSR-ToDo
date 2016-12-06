# ---------------------------------------------------------------------
# Book:         
# ---------------------------------------------------------------------
# Quantlet:     MSRpdf_cop_Frank
# ---------------------------------------------------------------------
# Description:  MSRpdf_cop_Frank plots the Frank copula density 
#               with parameter p=2.
# ---------------------------------------------------------------------
# Usage:        MSRpdf_cop_Frank
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       Plot of the Frank copula density.
# ---------------------------------------------------------------------
# Example:     
# ---------------------------------------------------------------------
# Author:       Zografia Anastasiadou, 20110603
# ---------------------------------------------------------------------

rm(list = ls(all = TRUE))
#setwd("C:/...")

install.packages("lattice")
library(lattice)

u = seq(0, 1, by = 0.02)
v = u
m = length(u) 
n = length(v)
U = matrix(rep(u, each = n), nrow = n)
V = matrix(rep(v, m), nrow = n)

p = 2

gcopuly = -p*(exp(-p*(U+V+1)) - exp(-p*(U+V)))/ ((exp(-p) + exp(-p*(U+V)) - exp(-p*U) - exp(-p*V))^2)

s = expand.grid(u = u, v = v)
wireframe(gcopuly ~ u*v, s, shade = TRUE, xlab = "X", ylab = "Y", zlab = "Z", 
    main = "Frank Copula Density, \\theta = 2", scales = list(arrows = FALSE))