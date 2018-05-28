[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSRvar_pot** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet: MSRvar_pot

Published in: Measuring Statistical Risk

Description: 'Computes Value-at-Risk with Peaks Over Treshold model with generalized Pareto distribution for data from Siemens and BMW (1999 - 2006).'

Keywords: VaR, pareto, extreme-value, financial, risk, tail, distribution

Author: Barbara Choros

See also: MSRvar_pot_params

Usage: '[var,ksi,beta,u]=msr_var_pot(x,y,z);'

Input: 'x- vector of returns'

Output: 'var- Value at Risk
beta- scaling parameter
ksi- shape parameter
u- threshold'

```

### MATLAB Code
```matlab


function MSRvar_pot(x)
clc;
close all;
a = load('Bay9906_close_2kPoints.txt','-ascii');
b = load('Bmw9906_close_2kPoints.txt','-ascii');
c = load('Sie9906_close_2kPoints.txt','-ascii');
d = a + b + c;
x = d(2:end)-d(1:end-1);
x = - x;
T = length(x);
h = 250;
p = 0.95;
q = 0.1;
for i = 1:T-h
    y = x(i:i+h-1);
    [var(i),ksi(i),beta(i),u(i)]=var_pot(y,h,p,q);
end
save ('VaR9906_pot_Portf.txt','var','-ascii');
save ('ksi_pot_Portf.txt','ksi','-ascii');
save ('beta_pot_Portf.txt','beta','-ascii');
save ('u_pot_Portf.txt','u','-ascii');
function [var, ksi, beta, u] = var_pot(y,h,p,q);
N      = floor(h*q);
ys     = sort(y,'descend');
u      = ys(N+1);
z      = y(y>u)-u;
params = gpfit(z);
ksi    = params(1);
beta   = params(2);
var    = u + beta/ksi*((h/N*(1 - p))^(-ksi) - 1);
```

automatically created on 2018-05-28