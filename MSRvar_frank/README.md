[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSRvar_frank** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet: MSRvar_frank

Published in: Measuring Statistical Risk

Description: 'Computes Value-at-Risk with Frank copula model for real financial data from Bayer and Siemens (1999 -2006).'

Author: Barbara Choros

Keywords: Frank, VaR, copula, financial, distribution

See also: 'MSRvar_clayton, MSRvar_coptStudent, MSRvar_gumbel'

Usage: '[VaR,theta]=var_frank(x,y,wx,wy,dofx,dofy);'
```

### MATLAB Code
```matlab


function MSRvar_frank
clc;

wx    = 1; 
wy    = 1;
x     = load('Bay9906_close_2kPoints.txt','-ascii');
dofx  = 6;
y     = load('Sie9906_close_2kPoints.txt','-ascii');
dofy  = 5;
[v,t] = var_frank(x,y,wx,wy,dofx,dofy);
save('VaR9906_cF_BaySie_2kPoints.txt','v','-ascii');
% --------------------------------------------------------------------- 
x     = load('Bmw9906_close_2kPoints.txt','-ascii');
dofx  = 7;
y     = load('Vow9906_close_2kPoints.txt','-ascii');
dofy  = 8;
[v,t] = var_frank(x,y,wx,wy,dofx,dofy);
save('VaR9906_cF_BmwVow_2kPoints.txt','v','-ascii');
% ---------------------------------------------------------------------
x     = load('Sie9906_close_2kPoints.txt','-ascii');
dofx  = 5;
y     = load('Vow9906_close_2kPoints.txt','-ascii');
dofy  = 8;
[v,t] = var_frank(x,y,wx,wy,dofx,dofy);
save('VaR9906_cF_SieVow_2kPoints.txt','v','-ascii');

function [VaR,theta] = var_frank(x, y, wx, wy, dofx, dofy);
    rx    = log(x(2:end)./x(1:end-1));
    mx    = mean(rx);
    stx   = std(rx);
    rx    = (rx-mx)/stx;
    ry    = log(y(2:end)./y(1:end-1));
    my    = mean(ry);
    sty   = std(ry);
    ry    = (ry-my)/sty;
    rx    = tcdf(rx,dofx);
    ry    = tcdf(ry,dofy);
    h     = 250;
    n     = 10000;
    alpha = 0.05;
    T = length(rx);

for i = 1:T-h
    a = rx(i:i+h-1); b = ry(i:i+h-1);
    theta(i) = theta_frank(a, b);
    U  = copularnd('Frank', theta(i), n);
    ux = tinv(U(:,1),dofx);
    uy = tinv(U(:,2),dofy);
    ux = ux.*stx+mx;
    uy = uy.*sty+my;
    L  = wx.*x(i+h).*(exp(ux)-1)+wy.*y(i+h).*(exp(uy)-1); 
    stats = sort(L);
    VaR(i) = stats(alpha*n+1);
end;

function tF = theta_frank(x, y);
    scale = 100;
    max_t = 0.1*scale;
    tF    = max_t/scale;
    while tF == max_t/scale
        min_t = max_t; max_t = max_t+scale;
        for i = min_t:max_t
            t = i/scale;
            df = density_frank(x, y, t);
            loglike(i-min_t+1) = sum(log(df));
        end;
        maks = max(loglike);
        tF = (find(loglike == maks) + min_t-1)/scale;
end;

function gf = density_frank(u, v, p)
gf = -p.*(exp(-p.*(u+v+1))-exp(-p.*(u+v)))./...
    ((exp(-p)+exp(-p.*(u+v))-exp(-p.*u)-exp(-p.*v)).^2);
```

automatically created on 2018-05-28