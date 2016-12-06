% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRvar_frank
% ---------------------------------------------------------------------
% Description:  MSRvar_frank computes Value-at-Risk with 
%               Frank copula model.
% ---------------------------------------------------------------------
% Usage:        [VaR,theta]=var_frank(x,y,wx,wy,dofx,dofy);
% ---------------------------------------------------------------------
% Inputs:       x,y - vectors of returns
%               wx,wy - weights of assets in the portfolio
%               dofx,dofy - degrees of freedom of t-distributions of 
%               margins
% ---------------------------------------------------------------------
% Output:       VaR - vector of Value at Risk
%               theta - vector of Frank copula parameters
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Reference:    Franke, J., H�rdle, W. and Hafner, Ch.(2004)
%               Statistics of Financial Markets: An Introduction
% ---------------------------------------------------------------------
% Author:       Barbara Choros, 26.09.2007
% ---------------------------------------------------------------------

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