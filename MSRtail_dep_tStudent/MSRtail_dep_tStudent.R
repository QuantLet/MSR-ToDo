# ---------------------------------------------------------------------
# Book:         
# ---------------------------------------------------------------------
# Quantlet:     MSRtail_dep_tStudent
# ---------------------------------------------------------------------
# Description:  MSRtail_dep_tStudent Plots the function 
#               2 * P{X_1 > F^(-1)_1(v) | X_2 = F^(-1)_2(v)} for a 
#               bivariate Student t distribution with correlation 
#               coeffcients -0.8, -0.6, . . . , 0.6, 0.8.
# ---------------------------------------------------------------------
# Usage:        MSRtail_dep_tStudent
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       Plots the function  2 * P{X_1 > F^(-1)_1(v) | X_2 =
#               F^(-1)_2(v)}. 
# ---------------------------------------------------------------------
# Example:     
# ---------------------------------------------------------------------
# Author:       Zografia Anastasiadou 20110607
# ---------------------------------------------------------------------

rm(list = ls(all = TRUE))
#setwd("C:/...")

rho = seq(-0.8, 0.8, by=0.2)
n   = length(rho)
v   = seq(0.5,1,by=0.01)
DoF = 3

lambda = matrix(1,nrow=length(v),ncol=length(rho))
for (i in 1:n){
	lambda[, i] = 2*(1-pt(sqrt((DoF+1)/(DoF/(qt(v,3)^2)+1))*
        sqrt((1-rho[i])/(1+rho[i])),DoF+1))
}
	
plot(v,  lambda[,1], type = "l", xlab = "v", ylab = expression(lambda[U](v)))
lines(v, lambda[,2])
lines(v, lambda[,3])
lines(v, lambda[,4])
lines(v, lambda[,5])
lines(v, lambda[,6])
lines(v, lambda[,7])
lines(v, lambda[,8])
lines(v, lambda[,9])
text(0.55,0.4,"rho = -0.8")
text(0.81,0.7,"rho = 0.6")
text(0.88,0.75,"rho = 0.8")