[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSRtailHill** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet: MSRtailHill

Published in: Measuring Statistical Risk

Description: 'MSRtailHill calculates value of Hill estimator for the negative log-returns of portfolio (Bayer, BMW, Siemens), time period: from 1992-01-01 to 2006-09-21.'

Author: Zografia Anastasiadou

Keywords: hill-estimator, tail area (of a distribution), tail, financial, time-series, distribution

See also: 'MSRtailGPareto, MSRtail_dep_normal, MSRtail_dep_tStudent, MSRtaildep_tcdf, MSRtailport'
```

### R Code
```r

rm(list=ls(all=TRUE))
#setwd("C:/...")

a  = read.table('Bay9906_close_2kPoints.txt')
b  = read.table('Bmw9906_close_2kPoints.txt')
c  = read.table('Sie9906_close_2kPoints.txt')
d  = a + b + c

n1 = dim(d)[1]
x  = log(d[1:n1-1, ]/d[2:n1,]) #negative log-returns
n  = length(x)
x  = sort(x, decreasing = TRUE)
k  = 100
x  = x[1:k]

gammaH = mean(log(x))-log(x[k])
alphaH = (mean(log(x)) -log(x[k]))^(-1)
sigmaH = x[k]*(k/n)^(1/alphaH)
sigmaH
```

automatically created on 2018-05-28

### MATLAB Code
```matlab


function MSRtailHill
clc
close all
a      = load('Bay9906_close_2kPoints.txt','-ascii');
b      = load('Bmw9906_close_2kPoints.txt','-ascii');
c      = load('Sie9906_close_2kPoints.txt','-ascii');
d      = a + b + c;
x      = log(d(1:end-1)./d(2:end)); %negative log-returns
n      = length(x);
x      = sort(x,'descend');
k      = 100;
x      = x(1:k,:);
gammaH = mean(log(x))-log(x(k))
alphaH = (mean(log(x))-log(x(k)) )^(-1)
sigmaH = x(k)*(k/n)^(1/alphaH)
```

automatically created on 2018-05-28