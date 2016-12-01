% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRtcopulaparam
% ---------------------------------------------------------------------
% Description:  MSRtcopulaparam computes number of degrees of freedom 
%               and correlation parameter rho for t-Student copula.
% ---------------------------------------------------------------------
% Usage:        MSRtcopulaparam
% ---------------------------------------------------------------------
% Inputs:       x, y: N x 1 vectors
% ---------------------------------------------------------------------
% Output:       r: correlation coefficient
%               v: degrees of freedom.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Reference     Claudio Romano, "Calibrating and simulating copula
%               functions: an application to the italian stock market",
%               November 2002
% ---------------------------------------------------------------------
% Author:       Barbara Choros, 24.09.2007
% ---------------------------------------------------------------------

function [r,v]=MSRtcopulaparam(x,y);
T=length(x);
z=[x';y'];
N=size(z,1);
u=unif_var(z);
Rcml=zeros(N,N);
for i=1:N-1
    for j=i+1:N
        Rcml(i,j)=corr(u(i,:)',u(j,:)','type','Kendall');
        Rcml(j,i)=Rcml(i,j);
    end;
    Rcml(i,i)=1;
end;
Rcml(N,N)=1;
Rcml=sin(pi/2.*Rcml);
r=Rcml(1,2);
v=3;
loglike1=log_dens_t(v,Rcml,u);
v=v+1;
loglike2=log_dens_t(v,Rcml,u);
while loglike1<loglike2
    loglike1=loglike2;
    v=v+1;
    loglike2=log_dens_t(v,Rcml,u);
    if v==30 break; end;
end;
v=v-1;
function s=unif_var(x)
N=size(x,1);
T=size(x,2);
for i=1:N
    for j=1:T
    dys(i,j)=sum(x(i,:)<=x(i,j));
    end;
end;
s=dys./(T+1);
function s=log_dens_t(v,R,u)
si=size(u);
n=si(1);
T=si(2);
y=tinv(u,v);
g=T*log(gamma((v+n)/2)/gamma(v/2))-T*n*log(gamma((v+1)/2)/gamma(v/2))-T/2*log(abs(det(R)));
a=sum(log(1+y.^2./v));
b=sum(a);
for i=1:T
c(i)=log(1+(y(:,i)'*inv(R)*y(:,i))./v);
end
c=sum(c);
s=g-(v+n)/2*c+(v+1)/2*b;