% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRtail_dep_tStudent
% ---------------------------------------------------------------------
% Description:  MSRtail_dep_tStudent Plots the function 
%               2 * P{X_1 > F^(-1)_1(v) | X_2 = F^(-1)_2(v)} for a 
%               bivariate Student t distribution with correlation 
%               coeffcients -0.8, -0.6, . . . , 0.6, 0.8.
% ---------------------------------------------------------------------
% Usage:        MSRtail_dep_tStudent
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Plots the function  2 * P{X_1 > F^(-1)_1(v) | X_2 =
%               F^(-1)_2(v)}. 
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       
% ---------------------------------------------------------------------

close all
clear
clc

rho=-0.8:0.2:0.8;
n=length(rho);
DoF=3;
for i=1:n
v=0.5:0.01:1;
lambda=2*(1-tcdf(sqrt((DoF+1)./(DoF./(tinv(v,3).^2)+1))*sqrt((1-rho(i))/(1+rho(i))),DoF+1));

%lambda
hold on
plot(v,lambda,'k');
hold off
text(0.54,0.4,'rho=-0.8')
text(0.79,0.7,'rho=0.6')
text(0.86,0.75,'rho=0.8')
xlabel('v')
ylabel('lambda_U(v)')
end