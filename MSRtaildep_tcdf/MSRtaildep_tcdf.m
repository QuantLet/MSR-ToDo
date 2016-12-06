% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRtaildep_tcdf
% ---------------------------------------------------------------------
% Description:  MSRtaildep_tcdf estimates tail dependece coefficient
%               for two stocks when the joint distribution is modeled 
%               with bivariate t-Student distribution.
% ---------------------------------------------------------------------
% Usage:        MSRtaildep_tcdf
% ---------------------------------------------------------------------
% Inputs:       None.
% ---------------------------------------------------------------------
% Output:        Tail dependece coefficient.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Barbara Choros,  25.06.2008
% ---------------------------------------------------------------------
function MSRtaildep_tcdf
clc;
close all;
x1     = load('BMW9906_standLogRet.dat');
x2     = load('Vow9906_standLogRet.dat');
lambda = taildep_tcdf(x1, x2)

x1     = load('Sie9906_standLogRet.txt');
x2     = load('Vow9906_standLogRet.txt');
lambda = taildep_tcdf(x1, x2)

x1     = load('Bay9906_standLogRet.txt');
x2     = load('Sie9906_standLogRet.txt');
lambda = taildep_tcdf(x1, x2)


function lambda = taildep_tcdf(x, y);
    tau    = corr(x, y, 'type', 'Kendall');
    rho    = sin(pi*tau/2);
    a      = DoFest(x, y);%variation index for bivariate t-distribution
    upbond = fun(rho);
    p      =  quad(@myfun, 0, upbond, [], [], a);
    q      =  quad(@myfun, 0, 1, [], [], a);
lambda = p/q;

function y  =  myfun(x, a) 
    y = x.^a./sqrt(1 - x.^2);

function h = fun(r)
    h = (1 + ((1-r)^2/(1 - r^2)))^(-1/2);
    function dof = DoFest(x1, x2);
R = [x1, x2];

for i = 3:30
    q(i-2) = sum(sum(log(tpdf(R, i))));
end;

maks = max(q);
dof  = find(q == maks)+ 2 ;