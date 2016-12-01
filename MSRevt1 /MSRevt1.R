# ---------------------------------------------------------------------
# Book:        
# ---------------------------------------------------------------------
# Quantlet:     MSRevt1
# ---------------------------------------------------------------------
# Description:  MSRevt1 computes and displays extreme value
#               distributions: Frechet, Gumbel and Weibull. 
# ---------------------------------------------------------------------
# Usage:        MSRevt1
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       Extreme value distribution pdfs.
# ---------------------------------------------------------------------
# Example:      -
# ---------------------------------------------------------------------
# Author:       Zografia Anastasiadou, Ye Hua 20110401
# ---------------------------------------------------------------------


rm(list=ls(all=TRUE))
setwd("C:/...")

install.packages("evd")
library(evd)

n<-100
sp<-5
xpos<-sp*(1:n)/n
xneg<--sp+xpos
x<-c(xneg,xpos)

alpha<-1/2
gumb<-cbind(x,dgev(x))
frec<-cbind(x,dgev(x,1,0.5,alpha))
weib<-cbind(x,dgev(x,-1,0.5,-alpha))

plot(weib,type="l",col="blue",lwd=3,lty=4,xlab="X",ylab="Y",main="Extreme Value Densities")
lines(frec,type="l",col="red",lwd=3,lty=3)
lines(gumb,type="l",col="black",lwd=3)