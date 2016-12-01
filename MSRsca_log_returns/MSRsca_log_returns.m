% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRsca_log_returns
% ---------------------------------------------------------------------
% Description:  MSRlog_returns plots the scatterplot of the log-returns 
%               of DEM/USD and GBP/USD from 01.12.1979 to 01.04.1994.
% ---------------------------------------------------------------------
% Usage:        MSRsca_log_returns
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Scatterplot of log-returns.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Barbara Choros
% ---------------------------------------------------------------------

x=load('fx.dat');
returns=diff(log(x)); 
t=23:4*257:length(x);
scatter(returns(:,1),returns(:,2),'b','.')
title('FX Log-Returns')
xlabel('DEM/USD');
ylabel('GBP/USD');
xlim([-0.045 0.04])
ylim([-0.045 0.04])
