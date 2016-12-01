% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRsca_sie_vw
% ---------------------------------------------------------------------
% Description:  MSRsca_sie_vw provides a scatterplot of daily 
%               standardized log-returns of Siemens versus Volkswagen.
% ---------------------------------------------------------------------
% Usage:        MSRsca_sie_vw
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Scatterplot of daily standardized log-returns.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang H�rdle, Barbara Choros
% ---------------------------------------------------------------------

x1=load('Sie9906_standLogRet.dat');
x2=load('Vow9906_standLogRet.dat');

scatter(x1,x2,'.','b')
title('Log-Returns of Siemens versus Volkswagen')
xlabel('Standardized Log-Returns of Siemens')
ylabel('Standardized Log-Returns of Volkswagen')
xlim([-8 8])
ylim([-8 8])