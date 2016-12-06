% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRutd_bmw_vw
% ---------------------------------------------------------------------
% Description:  MSRsca_bmw_vw provides a scatterplot of daily 
%               standardized log-returns of BMW versus Volkswagen.
% ---------------------------------------------------------------------
% Usage:        MSRutd_bmw_vw
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Scatterplot of daily standardized log-returns with
%               marked upper tail dependence.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang H�rdle, Barbara Choros
% ---------------------------------------------------------------------

x1 = load('BMW9906_standLogRet.dat');
x2 = load('Vow9906_standLogRet.dat');
x1 = tcdf(x1,8);
x2 = tcdf(x2,7);
x  = [0.9; 0.9; 1; 1];
y  = [0.9; 1; 1; 0.9];
fill(x, y, 'y')
hold on
scatter(x1, x2, '.')
plot(0.9, [0:0.001:1], 'r', 'LineWidth', 2)
plot([0:0.001:1], 0.9, 'r', 'LineWidth', 2)
hold off
xlabel('BMW')
ylabel('Volkswagen')
