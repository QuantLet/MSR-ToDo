# ---------------------------------------------------------------------
# Book:         
# ---------------------------------------------------------------------
# Quantlet:     MSRsca_log_returns
# ---------------------------------------------------------------------
# Description:  MSRsca_log_returns plots the scatterplot of the log-returns 
#               of DEM/USD and GBP/USD from 01.12.1979 to 01.04.1994.
# ---------------------------------------------------------------------
# Usage:        MSRsca_log_returns
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       Scatterplot of log-returns.
# ---------------------------------------------------------------------
# Example:     
# ---------------------------------------------------------------------
# Author:       Zografia Anastasiadou 20110606
# ---------------------------------------------------------------------

graphics.off()
rm(list=ls(all=TRUE))
#setwd("C:/...")

x=read.table("fx_dem_gbp_usd.dat")
x<-as.matrix(x)

returns=diff(log(x))

t<-seq(23,nrow(x),by=4*257)

plot(returns[,1],returns[,2],col="blue",xlab="DEM/USD",ylab="GBD/USD",xlim=c(-0.045,0.04),ylim=c(-0.045,0.04),pch=20)