% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRtail_dep_normal
% ---------------------------------------------------------------------
% Description:  MSRtail_dep_normal Plots the function 
%               2 * P{X_1 > F^(-1)_1(v) | X_2 = F^(-1)_2(v)} for a 
%               bivariate normal distribution with correlation 
%               coeffcients -0.8, -0.6, . . . , 0.6, 0.8.
% ---------------------------------------------------------------------
% Usage:        MSRtail_dep_normal
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

function MSRtail_dep_normal
close all
rho = -0.8:0.2:0.8;
n   = length(rho);

for i = 1:n
    v = 0.5:0.01:1;
    sigma = 1-rho(i)^2;
    sigma = sqrt(sigma);
    lambda = 2*(1 - normcdf(norminv(v)*sqrt(1 - rho(i))/sqrt(1 + rho(i))));

%lambda
hold on
plot(v, lambda, 'k');
hold off
text(0.55, 0.4, 'rho=-0.8')
text(0.8, 0.7, 'rho=0.6')
text(0.86, 0.75, 'rho=0.8')
xlabel('v')
ylabel('lambda_U(v)')
end