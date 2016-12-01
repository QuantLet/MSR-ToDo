# ---------------------------------------------------------------------
# Book:         
# ---------------------------------------------------------------------
# Quantlet:     MSRfibonacci
# ---------------------------------------------------------------------
# Description:  The random number generator of uniform random numbers. 
#               The function uses Fibonacci method.
# ---------------------------------------------------------------------
# Usage:        MSRfibonacci
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       Plot of uniform random numbers.
# ---------------------------------------------------------------------
# Example:      A plot is generated for the following parameter values:
#               nn=18, a=1366, b=150889, M=714025, seed=1234567, 
#               n=10000.
# ---------------------------------------------------------------------
# Author:       Zografia Anastasiadou 20110405 
# ---------------------------------------------------------------------

rm(list=ls(all=TRUE))
setwd("C:/...")

# input parameters
nn<-18
a<-1366
b<-150889
M<-714025
seed<-1234567
n<-10000

# main computation
yy<-1:nn
yy[1]<-seed
i<-2
while(i<=nn){
    yy[i]<-(a*yy[i-1]+b)%%M
    i<-i+1
}
yy<-yy/M
y1<-yy

y<-y1[1:18]
i<-19
while (i<=n+18){
    zeta<-y[i-17]-y[i-5]
    zeta<-(zeta+1)*(zeta<0)+(zeta*(zeta>=0))
    y[i]<-zeta
    i<-i+1
}
y<-y[19:(n+18)]

# output
plot(y[1:(n-2)],y[2:(n-1)],pch=20,cex=0.5,col="blue",xlab="Ui-1",ylab="Ui")