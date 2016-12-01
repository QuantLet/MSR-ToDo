% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSR_Frechet_bounds
% ---------------------------------------------------------------------
% Description:  MSR_Frechet_bounds plots the tree copula functions:
%               maximum, minimum and product.
% ---------------------------------------------------------------------
% Usage:        MSRpdf_cop_tStudent
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Plot of the Frechet copulae and product Copula.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Barbara Choros
% ---------------------------------------------------------------------

function MSR_Frechet_bounds
x=0:0.01:1;
[x,y] = meshgrid(x);
m=min(x,y);
w=max(x+y-1,0);
Pi=x.*y;
figure
mesh(x,y,m);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('M(x,y)')
grid on 
figure
mesh(x,y,w);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('W(x,y)')
grid on
figure
mesh(x,y,Pi)
xlabel('X');
ylabel('Y');
zlabel('Z');
title('\\Pi(x,y)')
