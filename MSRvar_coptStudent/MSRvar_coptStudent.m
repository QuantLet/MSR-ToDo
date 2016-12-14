

function MSRvar_coptStudent
clc;
wx   = 1;
wy   = 1;
x    = load('Bay9906_close_2kPoints.txt','-ascii');
dofx = 6;
y    = load('Sie9906_close_2kPoints.txt','-ascii');
dofy = 5;
v    = var_coptStudent(x,y,wx,wy,dofx,dofy);
save('VaR9906_ctS_BaySie_2kPoints.txt','v','-ascii');
% --------------------------------------------------------------------- 
x    = load('Bmw9906_close_2kPoints.txt','-ascii');
dofx = 7
y    = load('Vow9906_close_2kPoints.txt','-ascii');
dofy = 8;
v    = var_coptStudent(x,y,wx,wy,dofx,dofy);
save('VaR9906_ctS_BmwVow_2kPoints.txt','v','-ascii');
% ---------------------------------------------------------------------
x    = load('Sie9906_close_2kPoints.txt','-ascii');
dofx = 5
y    = load('Vow9906_close_2kPoints.txt','-ascii');
dofy = 8;
v    = var_coptStudent(x,y,wx,wy,dofx,dofy);
save('VaR9906_ctS_SieVow_2kPoints.txt','v','-ascii');
% ---------------------------------------------------------------------
function VaR = var_coptStudent(x,y,wx,wy,dofx,dofy);
rx    = log(x(2:end)./x(1:end-1));
mx    = mean(rx);
stx   = std(rx);
rx    = (rx-mx)/stx;
ry    = log(y(2:end)./y(1:end-1));
my    = mean(ry);
sty   = std(ry);
ry    = (ry-my)/sty;
rx    = tcdf(rx,dofx);
ry    = tcdf(ry,dofy);
h     = 250;
n     = 10000;
alpha = 0.05;
T     = length(rx);
for i = 1:T-h
    a = rx(i:i+h-1);b = ry(i:i+h-1);
    [r,v] = MSRtcopulaparam(a,b);
    U  = copularnd('t',r,v,n);
    ux = tinv(U(:,1),dofx);
    uy = tinv(U(:,2),dofy);
    ux = ux.*stx+mx;
    uy = uy.*sty+my;
    L = wx.*x(i+h).*(exp(ux)-1)+wy.*y(i+h).*(exp(uy)-1);  
    stats = sort(L);
    VaR(i) = stats(alpha*n+1);
end;