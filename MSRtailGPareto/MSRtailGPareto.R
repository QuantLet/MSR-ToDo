# ---------------------------------------------------------------------
# Book:         
# ---------------------------------------------------------------------
# Quantlet:     MSRtailGPareto
# ---------------------------------------------------------------------
# Description:  MSRtailGPareto estimates the parameters of Generalized 
#               Pareto Distribution for the negative log-returns of 
#               portfolio (Bayer, BMW, Siemens), time period: from 
#               1992-01-01 to 2006-09-21, and produces QQ-plot and 
#               PP-plot.
# ---------------------------------------------------------------------
# Usage:        MSRtailGPareto
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       QQ-plot and PP-plot with Generalized Pareto 
#               Distribution.
# ---------------------------------------------------------------------
# Example:     
# ---------------------------------------------------------------------
# Author:       Zografia Anastasiadou, 20110623
# ---------------------------------------------------------------------

rm(list=ls(all=TRUE))
#setwd("C:/...")

install.packages("QRMlib")
library(QRMlib)

a<-read.table('Bay9906_close_2kPoints.txt')
b<-read.table('Bmw9906_close_2kPoints.txt')
c<-read.table('Sie9906_close_2kPoints.txt')
d<-a+b+c

n1<-dim(d)[1]
x<-log(d[1:n1-1,]/d[2:n1,]) #negative log-returns
n<-100                     

gpd<-fit.GPD(x,nextremes=n,method="ml",information="observed") 
t<-(1:n)/(n+1)
y1<-qGPD(t,gpd$par.ests[1],gpd$par.ests[2])                   
 
gpdt<-sort(gpd$data)-gpd$threshold                             
y2=pGPD(gpdt,gpd$par.ests[1],gpd$par.ests[2])            
                                                    
plot(gpdt,y1,col="blue",pch=21,bg="blue",ylim=c(0,0.06),xlab="",ylab="",main="QQ plot, Generalized Pareto Distribution")
lines(y1,y1,type="l",col="red",lwd=2)  

plot(y2,t,col="blue",pch=21,bg="blue",xlab="",ylab="",main="PP plot, Generalized Pareto Distribution")
lines(y2,y2,type="l",col="red",lwd=2)