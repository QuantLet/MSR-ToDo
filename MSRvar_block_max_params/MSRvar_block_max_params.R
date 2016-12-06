# ---------------------------------------------------------------------
# Book:         
# ---------------------------------------------------------------------
# Quantlet:     MSRvar_block_max_params
# ---------------------------------------------------------------------
# Description:  MSRvar_block_max_params provides parameters estimated 
#               for calculating Value-at-Risk with Block Maxima Model.
# ---------------------------------------------------------------------
# Usage:        MSRvar_block_max_params
# ---------------------------------------------------------------------
# Inputs:       k - shape parameter
#               a - scale parameter
#               b - location parameter
# ---------------------------------------------------------------------
# Output:       Parameters estimated for calculating Value-at-Risk with 
#               Block Maxima Model.
# ---------------------------------------------------------------------
# Example:     
# ---------------------------------------------------------------------
# Reference:    Franke, J., Haerdle, W. and Hafner, Ch.(2004)
#               Statistics of Financial Markets: An Introduction
# ---------------------------------------------------------------------
# Author:       Zografia Anastasiadou 20110607
# ---------------------------------------------------------------------

rm(list = ls(all = TRUE))
#setwd("C:/...")

k  =  t(read.table("kappa_bMax_Portf.txt"))
a  =  t(read.table("alpha_bMax_Portf.txt"))
b  =  t(read.table("beta_bMax_Portf.txt"))

plot(k, type = "l", col = "blue", ylim = c(-1, 6), ylab = "", xlab = "", 
    main = "Parameters in Block Maxima Model", axes = FALSE)
lines(a, col = "red")
lines(b, col = "magenta")
box()
axis(1, c(261, 521, 782, 1043, 1304, 1566, 1826)-250, 
    c("Jan 2000", "Jan 2001", "Jan 2002", "Jan 2003", "Jan 2004", "Jan 2005", "Jan 2006"))
axis(2)
legend("topright", c("Shape Parameter", "Scale Parameter", "Location Parameter"), 
    pch = c(15, 15, 15), col = c("blue", "red", "magenta"))