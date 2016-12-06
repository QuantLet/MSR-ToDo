% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSR_TDC_tStudent
% ---------------------------------------------------------------------
% Description:  MSR_TDC_tStudent plots the tail dependence coefficient
%               of t-Student copula as the function of correlation and
%               the number of degrees of freedom.
% ---------------------------------------------------------------------
% Usage:        MSR_TDC_tStudent
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Plot of the tail dependence coefficient of t-Student 
%               copula.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Barbara Choros
% ---------------------------------------------------------------------

function MSR_TDC_tStudent
d     = 3:103;
r     = -1:.02:1;
[r,d] = meshgrid(r, d);
x     = r(:);
y     = d(:);
N     = length(x);
t     = 2 - 2*tcdf(sqrt(y + 1).*sqrt(1 - x)./sqrt(1 + x), y + 1);
f     = reshape(t, sqrt(N), []);

figure;
mesh(d, r, f);
axis([0 110 -1 1 0 1])
xlabel('DoF');
ylabel('rho');
zlabel('TDC');
xlabel('Degrees of Freedom');
ylabel('Correlation');
zlabel('Tail Dependence Coefficient');
title('Tail Dependence Coefficient for t-Student Copula')