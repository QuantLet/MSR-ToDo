% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRpdf_cop_Clayton
% ---------------------------------------------------------------------
% Description:  MSRpdf_cop_Clayton plots the Clayton copula density 
%		with parameter p=2.
% ---------------------------------------------------------------------
% Usage:        MSRpdf_cop_Clayton
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Plot of the Clayton copula density.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Barbara Choros
% ---------------------------------------------------------------------

function MSRpdf_cop_Clayton
[u,v] = meshgrid(0:0.02:1);
p=2;
gcopuly=(u.^(-p)+v.^(-p)-1).^(-2-1/p).*(u.*v).^(-p-1).*(p+1);
grid on
mesh(u,v,gcopuly)
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Clayton Copula Density, \\theta = 2')