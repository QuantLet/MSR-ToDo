close all
clear 
clc

portRet = load('Port9906_2kPoints_GARCHn_Inn.txt', '-ascii');
size(portRet)
r = length(portRet);

mu = mean(portRet);
si = sqrt(var(portRet));
x  = si*normrnd(0,1,r,1) + mu;         
h  = 1.06*si*(r^(-0.2));

subplot(1,2,1)
[f1,xi1] = ksdensity(portRet, 'width', h); 
[f2,xi2] = ksdensity(x, 'width', h);

hold on
plot(xi1, f1, 'r')
plot(xi2, f2, 'b', 'LineStyle', '--')
title('Estimated Density (Nonparametric)')
hold off

subplot(1, 2, 2)
lfh = [xi1', log(f1)'];
lf  = [xi2', log(f2)'];
hold on

plot(lfh(:, 1), lfh(:, 2), 'r')
plot(lf(:, 1), lf(:, 2), 'b', 'LineStyle', '--')
title('Estimated Log-Density (Nonparametric)')
hold off