% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRvar_gumbel
% ---------------------------------------------------------------------
% Description:  MSRvar_gumbel computes Value-at-Risk with 
%               Gumbel copula model.
% ---------------------------------------------------------------------
% Usage:        [VaR,theta]=var_gumbel(x,y,wx,wy,dofx,dofy);
% ---------------------------------------------------------------------
% Inputs:       x,y - vectors of returns
%               wx,wy - weights of assets in the portfolio
%               dofx,dofy - degrees of freedom of t-distributions of 
%               margins
% ---------------------------------------------------------------------
% Output:       VaR - vector of Value at Risk
%               theta - vector of Gumbel copula parameters
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Reference:    Franke, J., H�rdle, W. and Hafner, Ch.(2004)
%               Statistics of Financial Markets: An Introduction
% ---------------------------------------------------------------------
% Author:        Barbara Choros, 26.09.2007
% ---------------------------------------------------------------------

function MSRvar_gumbel
clc;
wx=1;wy=1;
x=load('Bay9906_close_2kPoints.txt','-ascii');
dofx=6;
y=load('Sie9906_close_2kPoints.txt','-ascii');
dofy=5;
[v,t]=var_gumbel(x,y,wx,wy,dofx,dofy);
save('VaR9906_cG_BaySie_2kPoints.txt','v','-ascii');
% --------------------------------------------------------------------- 
x=load('Bmw9906_close_2kPoints.txt','-ascii');
dofx=7;
y=load('Vow9906_close_2kPoints.txt','-ascii');
dofy=8;
[v,t]=var_gumbel(x,y,wx,wy,dofx,dofy);
save('VaR9906_cG_BmwVow_2kPoints.txt','v','-ascii');
% ---------------------------------------------------------------------
x=load('Sie9906_close_2kPoints.txt','-ascii');
dofx=5;
y=load('Vow9906_close_2kPoints.txt','-ascii');
dofy=8;
[v,t]=var_gumbel(x,y,wx,wy,dofx,dofy);
save('VaR9906_cG_SieVow_2kPoints.txt','v','-ascii');
% --------------------------------------------------------------------- 
function [VaR,theta]=var_gumbel(x,y,wx,wy,dofx,dofy);
rx=log(x(2:end)./x(1:end-1));
mx=mean(rx);
stx=std(rx);
rx=(rx-mx)/stx;
ry=log(y(2:end)./y(1:end-1));
my=mean(ry);
sty=std(ry);
ry=(ry-my)/sty;
rx=tcdf(rx,dofx);
ry=tcdf(ry,dofy);
h=250;
n=10000;
alpha=0.05;
T=length(rx);
for i=1:T-h
    a=rx(i:i+h-1);b=ry(i:i+h-1);   
    theta(i)=theta_gumbel(a,b);
    U = copularnd('Gumbel',theta(i),n);
    ux=tinv(U(:,1),dofx);
    uy=tinv(U(:,2),dofy);
    ux=ux.*stx+mx;
    uy=uy.*sty+my;
    L=wx.*x(i+h).*(exp(ux)-1)+wy.*y(i+h).*(exp(uy)-1);  
    stats=sort(L);
    VaR(i)=stats(alpha*n+1);
end;
function tG=theta_gumbel(a,b);
v=[a,b];
scale=100;
zer=find(v==0);
nzer=length(zer);
if nzer>0
    for i=1:nzer
        v(zer(i))=eps;
    end;
end;
jed=find(v==1);
njed=length(jed);
if njed>0
    for i=1:njed
        v(jed(i))=0.9999;
    end;
end;
    max_t=1*scale;
    tG=max_t/scale;
    while tG==max_t/scale
    min_t=max_t;max_t=max_t+scale;
    for i=min_t:max_t
        t=i/scale;
        gcop=density_gumbel(a,b,t);
        loglike(i-min_t+1)=sum(log(gcop));
    end;
    maks=max(loglike);
    tG=(find(loglike==maks)+min_t-1)/scale;
    end;

function denG=density_gumbel(u,v,p)
arg=(-log(u)).^p+(-log(v)).^p;
denG=exp(-arg.^(1/p))./u./v.*(log(u).*log(v)).^(p-1).*...
    arg.^(1/p-2).*(p-1+arg.^(1/p));
