% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRsca_bmw_vw
% ---------------------------------------------------------------------
% Description:  MSRsca_bmw_vw provides a scatterplot of daily 
%               standardized log-returns of BMW versus Volkswagen.
% ---------------------------------------------------------------------
% Usage:        MSRsca_bmw_vw
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Scatterplot of daily standardized log-returns.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang H�rdle, Barbara Choros
% ---------------------------------------------------------------------

x1=load('BMW9906_standLogRet.dat');
x2=load('Vow9906_standLogRet.dat');

scatter(x1,x2,'.')
xlabel('Standardized Log-Returns of BMW')
ylabel('Standardized Log-Returns of Volkswagen')
xlim([-6.2 7])
ylim([-5.5 5.5])