

function MSRvar_block_max
clc;
close all;

a = load('Bay9906_close_2kPoints.txt', '-ascii');
b = load('Bmw9906_close_2kPoints.txt', '-ascii');
c = load('Sie9906_close_2kPoints.txt', '-ascii');
d = a+b+c;
x = d(2:end)-d(1:end-1);
x = -x;
T = length(x);
h = 250;
p = 0.95;
n = 16;

for i = 1:T-h
    y = x(i:i+h-1);
    [var(i), tau(i), alpha(i), beta(i), kappa(i)] = block_max(y, n, p);
end;

save ('VaR9906_bMax_Portf.txt', 'var', '-ascii');
save ('tau_bMax_Portf.txt', 'tau', '-ascii');
save ('alpha_bMax_Portf.txt', 'alpha', '-ascii');
save ('beta_bMax_Portf.txt', 'beta', '-ascii');
save ('kappa_bMax_Portf.txt', 'kappa', '-ascii');

function [var, tau, alpha, beta, kappa] = block_max(y, n, p)
T = length(y);
k = floor(T/n);

for j = 1:k-1
    r = y((j-1)*n+1:j*n);
    z(j) = max(r);
end;

r     = y((k-1)*n+1:end);
z(k)  = max(r);
mu    = mean(z);
sigma = std(z);
warning off

parmhat  =  gevfit(z);
kappa    = parmhat(1);
tau      = -1/kappa;
alpha    = parmhat(2);
beta     = parmhat(3);
pext     = p^n;
var      = beta+alpha/kappa*((-log(1-pext))^(-kappa)-1);