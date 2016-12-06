% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRvar_clayton_GARCHn
% ---------------------------------------------------------------------
% Description:  MSRvar_clayton_GARCHn Computes Value-at-Risk with 
%               Clayton copula model when margins are modelled with 
%               GARCH(1,1) process.
% ---------------------------------------------------------------------
% Usage:        [VaR,theta] = var_cC_GARCHn(x,y,ix,iy,sx,sy,px,py,wx,wy);
% ---------------------------------------------------------------------
% Inputs:       x,y - vectors of returns
%               wx,wy - weights of assets in the portfolio
%               ix,iy- innovations
%               sx,sy - sigmas: conditional standard deviation vector 
%               corresponding to innovations
%               px,py - parameters: K, GARCH(1), ARCH(1), C
% ---------------------------------------------------------------------
% Output:       VaR - vector of Value at Risk
%               theta - vector of Clayton copula parameters
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Reference:    Franke, J., Haerdle, W. and Hafner, Ch.(2004)
%               Statistics of Financial Markets: An Introduction
% ---------------------------------------------------------------------
% Author:       Barbara Choros, 26.09.2007
% ---------------------------------------------------------------------

function MSRvar_clayton_GARCHn
clc
x  = load('Bmw9906_close_2kPoints.txt','-ascii');
y  = load('Vow9906_close_2kPoints.txt','-ascii');
wx = 1;wy = 1;
ix = load('Bmw9906_GARCHn_Inn.txt','-ascii');
sx = load('Bmw9906_GARCHn_Sig.txt','-ascii');
px = load('Bmw9906_GARCHn_Param.txt','-ascii');
iy = load('Vow9906_GARCHn_Inn.txt','-ascii');
sy = load('Vow9906_GARCHn_Sig.txt','-ascii');
py = load('Vow9906_GARCHn_Param.txt','-ascii');
[VaR,theta] = var_cC_GARCHn(x,y,ix,iy,sx,sy,px,py,wx,wy);
save ('VaR9906_cC_GARCHn_BmwVow_2kPoints.txt','VaR','-ascii');

function [VaR,theta] = var_cC_GARCHn(x, y, ix, iy, sx, sy, px, py, wx, wy);
    rx = ix./sx;
    ry = iy./sy;
    ex = normcdf(rx, 0, 1);
    ey = normcdf(ry, 0, 1);
    h  = 250;
    n  = 10000;
    alpha = 0.05;
    T = length(rx);
    for i = 1:T-h
        a = ex(i:i+h-1);
        b = ey(i:i+h-1);
        theta(i) = theta_clayton(a, b);
        U  =  copularnd('Clayton', theta(i), n);
        ux = norminv(U(:, 1), 0, 1);
        uy = norminv(U(:, 2), 0, 1);
        kx = px(1) + px(2)*sx(i+h-1)^2 + px(3)*ix(i+h-1)^2;
        ky = py(1) + py(2)*sy(i+h-1)^2 + py(3)*iy(i+h-1)^2;
        ux = px(4) + ux.*sqrt(kx);
        uy = py(4) + uy.*sqrt(ky);
        L = wx.*x(i+h).*(exp(ux)-1) + wy.*y(i+h).*(exp(uy)-1);
        stats = sort(L);
        VaR(i) = stats(alpha*n+1);
end;

function tC = theta_clayton(a, b);
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
    tC   = (find(loglike==maks) + min_t-1)/scale;
end;

function gc = density_clayton(u, v, p);
    gc = (u.^(-p) + v.^(-p)-1).^(-2-1/p).*(u.*v).^(-p-1).*(p+1);