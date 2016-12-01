# ---------------------------------------------------------------------
# Book:         
# ---------------------------------------------------------------------
# Quantlet:     MSRtail_dep_normal
# ---------------------------------------------------------------------
# Description:  MSRtail_dep_normal Plots the function 
#               2 * P{X_1 > F^(-1)_1(v) | X_2 = F^(-1)_2(v)} for a 
#               bivariate normal distribution with correlation 
#               coeffcients -0.8, -0.6, . . . , 0.6, 0.8.
# ---------------------------------------------------------------------
# Usage:        MSRtail_dep_normal
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


rm(list=ls(all=TRUE))
#setwd("C:/...")

rho<-seq(-0.8,0.8,by=0.2)
n<-length(rho)
v<-seq(0.5,1,by=0.01)

lambda<-matrix(1,nrow=length(v),ncol=length(rho))
for (i in 1:n){
	sigma<-1-rho[i]^2
	sigma<-sqrt(sigma)
	lambda[,i]<-2*(1-pnorm(qnorm(v)*sqrt(1-rho[i])/sqrt(1+rho[i])))
	}

v1<-matrix(v,nrow=length(v),ncol=length(rho))
plot(v1,lambda,type="l",xlab="v",ylab=expression(lambda[U](v)))
text(0.55,0.4,"rho=-0.8")
text(0.82,0.7,"rho=0.6")
text(0.88,0.75,"rho=0.8")