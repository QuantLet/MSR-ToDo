% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRvar_pot
% ---------------------------------------------------------------------
% Description:  MSRvar_pot computes Value-at-Risk with 
%               Peaks Over Treshold model with generalized Pareto 
%               distribution.
% ---------------------------------------------------------------------
% Usage:        [var,ksi,beta,u]=msr_var_pot(x,y,z);   
% ---------------------------------------------------------------------
% Inputs:       x - vector of returns
% ---------------------------------------------------------------------
% Output:       var - Value at Risk
% 		ksi - shape parameter
% 		beta - scaling parameter
%	        u - threshold 
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Reference:    McNeil, A. (1999) Extreme Value Theory for Risk Managers
% ---------------------------------------------------------------------
% Author:       Barbara Choros, 14.10.2007
% ---------------------------------------------------------------------

function MSRvar_pot(x)
clc;
close all;
a = load('Bay9906_close_2kPoints.txt','-ascii');
b = load('Bmw9906_close_2kPoints.txt','-ascii');
c = load('Sie9906_close_2kPoints.txt','-ascii');
d = a + b + c;
x = d(2:end) - d(1:end-1);
x = -x;
T = length(x);
h = 250;
p = 0.95;
q = 0.1;

for i = 1:T-h
    y = x(i:i+h-1);
    [var(i), ksi(i), beta(i), u(i)] = var_pot(y, h, p, q);
end
save ('VaR9906_pot_Portf.txt','var','-ascii');
save ('ksi_pot_Portf.txt','ksi','-ascii');
save ('beta_pot_Portf.txt','beta','-ascii');
save ('u_pot_Portf.txt','u','-ascii');

function [var, ksi, beta, u] = var_pot(y, h, p, q);
N      = floor(h*q);
ys     = sort(y, 'descend');
u      = ys(N+1);
z      = y(y>u)-u;
params = gpfit(z);
ksi    = params(1);
beta   = params(2);
var    = u+beta/ksi*((h/N*(1-p))^(-ksi)-1);