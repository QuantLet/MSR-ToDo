[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSRvar_clayton** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet: MSRvar_clayton

Published in: Measuring Statistical Risk

Description: 'Computes Value-at-Risk with Clayton copula model and plots the time-varying parameters over time.'

Keywords: VaR, clayton, copula, risk, financial

Author: Barbara Choros

See also: 'MSRvar_clayton_GARCHn, MSRvar_coptStudent, MSRvar_frank, MSRvar_gumbel'

Usage: '[VaR,theta]=var_clayton(x,y,wx,wy,dofx,dofy);'

Input: 'wx,wy- weights of assets in the portfolio
dofx,dofy- degrees of freedom of t-distributions of
x,y- vectors of returns'

Output: 'theta- vector of Clayton copula parameters
VaR- vector of Value at Risk'
```

### MATLAB Code
```matlab


function MSRvar_clayton
clc;
wx    = 1;
wy    = 1;
x     = load('Bay9906_close_2kPoints.txt', '-ascii');
dofx  = 6;
y     = load('Sie9906_close_2kPoints.txt', '-ascii');
dofy  = 5;
[v, t] = var_clayton(x, y, wx, wy, dofx, dofy);
save('VaR9906_cC_BaySie_2kPoints.txt', 'v', '-ascii');
% --------------------------------------------------------------------- 
x     = load('Bmw9906_close_2kPoints.txt', '-ascii');
dofx  = 7;
y     = load('Vow9906_close_2kPoints.txt', '-ascii');
dofy  = 8;
[v, t] = var_clayton(x, y, wx, wy, dofx, dofy);
save('VaR9906_cC_BmwVow_2kPoints.txt', 'v', '-ascii');
% ---------------------------------------------------------------------
x      = load('Sie9906_close_2kPoints.txt', '-ascii');
dofx   = 5;
y      = load('Vow9906_close_2kPoints.txt', '-ascii');
dofy   = 8;
[v, t] = var_clayton(x, y, wx, wy, dofx, dofy);
save('VaR9906_cC_SieVow_2kPoints.txt', 'v', '-ascii');
% --------------------------------------------------------------------- 
function [VaR, theta] = var_clayton(x, y, wx, wy, dofx, dofy)
rx    = log(x(2:end)./x(1:end-1));
mx    = mean(rx);
stx   = std(rx);
rx    = (rx-mx)/stx;
ry    = log(y(2:end)./y(1:end-1));
my    = mean(ry);
sty   = std(ry);
ry    = (ry-my)/sty;
rx    = tcdf(rx, dofx);
ry    = tcdf(ry, dofy);
h     = 250;
n     = 10000;
alpha = 0.05;
T     = length(rx);

for i = 1:T-h
    a = rx(i:i+h-1);b = ry(i:i+h-1);   
    theta(i) = theta_clayton(a, b);
    U = copularnd('Clayton', theta(i), n);
    ux = tinv(U(:, 1), dofx);
    uy = tinv(U(:, 2), dofy);
    ux = ux.*stx+mx;
    uy = uy.*sty+my;
    L = wx.*x(i+h).*(exp(ux)-1) + wy.*y(i+h).*(exp(uy)-1);
    stats = sort(L);
    VaR(i) = stats(alpha*n+1);
end;

function tC = theta_clayton(a, b)
scale = 100;
max_t = 0.1*scale;
tC    = max_t/scale;
while tC == max_t/scale
min_t = max_t;max_t = max_t+scale;
for i = min_t:max_t
    t = i/scale;
    gc = density_clayton(a, b, t);
    loglike(i-min_t+1) = sum(log(gc));
end;
maks = max(loglike);
tC   = (find(loglike == maks) + min_t-1)/scale;
end;

function gc = density_clayton(u, v, p)
gc = (u.^(-p) + v.^(-p) - 1).^(-2 - 1/p).*(u.*v).^(-p - 1).*(p + 1);

```

automatically created on 2018-05-28