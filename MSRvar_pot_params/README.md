[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSRvar_pot_params** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet: MSRvar_pot_params

Published in: Measuring Statistical Risk

Description: 'Provides parameters estimated for calculating Value-at-Risk with Peaks Over Treshold model for financial data.'

Keywords: VaR, parametric, pareto, extreme-value, distribution, tail, risk

Author: Barbara Choros

See also: MSRvar_pot

Usage: 'MSRvar_pot_params
Input:
ksi- shape parameter
bet- scale parameter
u- threshold'

Datafiles: 'beta_pot_Portf.txt, ksi_pot_Portf.txt, u_pot_Portf.txt'
```

![Picture1](MSRvar_pot_params.png)

### R Code
```r


rm(list=ls(all=TRUE))
#setwd("C:/...")

bet = t(read.table("beta_pot_Portf.txt"))
ksi = t(read.table("ksi_pot_Portf.txt"))
u   = t(read.table("u_pot_Portf.txt"))

plot(bet,type = "l", col = "blue", ylim = c(-1, 5), ylab = "", xlab = "",
    main = "Parameters in Peaks Over Threshold Model", axes = FALSE)
lines(ksi, col = "red")
lines(u, col = "magenta")
box()
axis(1,c(261, 521, 782, 1043, 1304, 1566, 1826) - 250, 
    c("Jan 2000","Jan 2001","Jan 2002","Jan 2003","Jan 2004","Jan 2005","Jan 2006"))
axis(2)
legend("topright",c("Scale Parameter", "Shape Parameter", "Threshold"), 
    pch = c(15, 15, 15), col = c("blue", "red", "magenta"))
```

automatically created on 2018-05-28

### MATLAB Code
```matlab



function MSRvar_pot_params
clc;
close all;
bet = load('beta_pot_Portf.txt', '-ascii');
ksi = load('ksi_pot_Portf.txt', '-ascii');
u   = load('u_pot_Portf.txt', '-ascii');
%^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^PLOTS
plot(bet)
grid on
hold on
plot(ksi, 'Color', 'red')
plot(u, 'Color', 'm');
hold off
legend('Scale Parameter','Shape Parameter','Threshold')
title('Parameters in Peaks Over Threshold Model')
xlim([-3 1755])%xlim([-1.5 1752])
set(gca,'XTick',[261 521 782 1043 1304 1566 1826]-250)
set(gca,'XTickLabel',{'Jan 2000' 'Jan 2001' ...
   'Jan 2002' 'Jan 2003' 'Jan 2004' 'Jan 2005' 'Jan 2006'})
```

automatically created on 2018-05-28