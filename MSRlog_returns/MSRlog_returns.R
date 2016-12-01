# ---------------------------------------------------------------------
# Book:         
# ---------------------------------------------------------------------
# Quantlet:     MSRlog_returns
# ---------------------------------------------------------------------
# Description:  MSRlog_returns plots log-returns of DEM/USD and GBP/USD  
#               from 01.12.1979 to 01.04.1994.
# ---------------------------------------------------------------------
# Usage:        MSRlog_returns
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       Plot of log-returns.
# ---------------------------------------------------------------------
# Example:     
# ---------------------------------------------------------------------
# Author:       Zografia Anastasiadou, 20111101
# ---------------------------------------------------------------------

rm(list=ls(all=TRUE))
#setwd("C:/...")

x<-read.table('fx.dat')
x<-as.matrix(x)
returns<-diff(log(x)) 
t<-seq(23,dim(x)[1],by=4*257)

par(mfrow=c(2,1))
plot(returns[,1],type="l",col="blue",ylim=c(-0.05,0.05),xlab="",ylab="",main="Log returns DEM/USD",xaxt="n")
axis(1,at=t,labels=c(1980,1984,1988,1992))
plot(returns[,2],type="l",col="blue",ylim=c(-0.05,0.05),xlab="",ylab="",main="Log returns GBP/USD",xaxt="n")
axis(1,at=t,labels=c(1980,1984,1988,1992))