% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRvar_block_max_params
% ---------------------------------------------------------------------
% Description:  MSRvar_block_max_params provides parameters estimated 
%               for calculating Value-at-Risk with Block Maxima Model.
% ---------------------------------------------------------------------
% Usage:        MSRvar_block_max_params
% ---------------------------------------------------------------------
% Inputs:       k - shape parameter
%               a - scale parameter
%               b - location parameter
% ---------------------------------------------------------------------
% Output:       Parameters estimated for calculating Value-at-Risk with 
%               Block Maxima Model.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Reference:    Franke, J., Haerdle, W. and Hafner, Ch.(2004)
%               Statistics of Financial Markets: An Introduction
% ---------------------------------------------------------------------
% Author:       Barbara Choros, 31.10.2007
% ---------------------------------------------------------------------

function MSRvar_block_max_params
clc;
close all;
k = load('kappa_bMax_Portf.txt', '-ascii');
a = load('alpha_bMax_Portf.txt', '-ascii');
b = load('beta_bMax_Portf.txt', '-ascii');
%^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^PLOTS
plot(k)
grid on
hold on
plot(a,'Color', 'red')
plot(b,'Color', 'm');
hold off
legend('Shape Parameter','Scale Parameter','Location Parameter')
title('Parameters in Block Maxima Model')
xlim([-3 1755])%xlim([-1.5 1752])
set(gca,'XTick',[261 521 782 1043 1304 1566 1826]-250)
set(gca,'XTickLabel',{'Jan 2000' 'Jan 2001' ...
   'Jan 2002' 'Jan 2003' 'Jan 2004' 'Jan 2005' 'Jan 2006'})