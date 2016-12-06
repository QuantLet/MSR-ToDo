% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRportfolio_est
% ---------------------------------------------------------------------
% Description:  MSRportfolio_est calculates and plots the daily 
%               log-returns of the portfolio from 1992 to 2006 and the 
%               estimated density and log-density, respectively 
%               (nonparametric), kernel density estimator, gaussian 
%               kernel, bandwidth given by Silverman's rule-of-thumb.
% ---------------------------------------------------------------------
% Usage:        MSRportfolio_est
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Plots of the the daily log-returns of the portfolio and 
%               the estimated density and log-density, respectively 
%               (nonparametric).
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Barbara Choros
% ---------------------------------------------------------------------
close all
clear 
clc

portRet = load('Port9906_2kPoints_GARCHn_Inn.txt', '-ascii');
size(portRet)
r = length(portRet);

mu = mean(portRet);
si = sqrt(var(portRet));
x  = si*normrnd(0,1,r,1) + mu;         
h  = 1.06*si*(r^(-0.2));

subplot(1,2,1)
[f1,xi1] = ksdensity(portRet, 'width', h); 
[f2,xi2] = ksdensity(x, 'width', h);

hold on
plot(xi1, f1, 'r')
plot(xi2, f2, 'b', 'LineStyle', '--')
title('Estimated Density (Nonparametric)')
hold off

subplot(1, 2, 2)
lfh = [xi1', log(f1)'];
lf  = [xi2', log(f2)'];
hold on

plot(lfh(:, 1), lfh(:, 2), 'r')
plot(lf(:, 1), lf(:, 2), 'b', 'LineStyle', '--')
title('Estimated Log-Density (Nonparametric)')
hold off