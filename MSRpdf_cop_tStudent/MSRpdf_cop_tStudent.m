% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRpdf_cop_tStudent
% ---------------------------------------------------------------------
% Description:  MSRpdf_cop_tStudent plots the t-Student copula density 
%               with parameter r=0.4 and DoF=3.
% ---------------------------------------------------------------------
% Usage:        MSRpdf_cop_tStudent
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Plot of the t-Student copula density.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Barbara Choros
% ---------------------------------------------------------------------

function MSRpdf_cop_tStudent
    
v     = 3;
r     = 0.4;
wyzn  = 1-(r^2);
u     = [0:.01:1];
d     = length(u);
[u,w] = meshgrid(u);
y1    = tinv(u,v);
y2    = tinv(w,v);
y     = [y1(:),y2(:)];
R     = [1 r;r 1];
g     = (wyzn)^(-0.5).*gamma(v./2+1).*gamma(v./2)./gamma((v+1)./2).^2;

for i = 1:d^2
    c2(i) = ((1+y(i,1).^2./v).*(1+y(i,2).^2./v)).^((v+1)/2)./
        (1+(y(i,:)*inv(R)*y(i,:)')./v)^(v./2+1);
end;

c = c2*g;
f = reshape(c,d,[]); 
z = [u(:),w(:), c(:)];

figure;
mesh(u,w,f);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('t-Student Copula Density, \\nu=3, r=0.4')