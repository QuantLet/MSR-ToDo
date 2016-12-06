% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRpdf_cop_Frank
% ---------------------------------------------------------------------
% Description:  MSRpdf_cop_Frank plots the Frank copula density 
%               with parameter p=2.
% ---------------------------------------------------------------------
% Usage:        MSRpdf_cop_Frank
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Plot of the Frank copula density.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Barbara Choros
% ---------------------------------------------------------------------

function MSRpdf_cop_Frank
[u,v] = meshgrid(0:0.02:1);
p     = 2;

gcopuly = -p.*(exp(-p.*(u+v+1)) - exp(-p.*(u+v)))./...
    ((exp(-p) + exp(-p.*(u+v)) - exp(-p.*u) - exp(-p.*v)).^2);
grid on

mesh(u, v, gcopuly)
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Frank Copula Density, \\theta = 2')