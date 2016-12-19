clear
close all
clc

n    = 150;
xf1  = evrnd(0, 1, n, 1);
xf   = sort(xf1);
t    = (1:n)/(n + 1);
dat  = [evcdf(xf), t'];
dat2 = [t', t'];
hold on
scatter(dat(:, 1), dat(:, 2), '.')
plot(dat2(:, 1), dat2(:, 2), 'r', 'LineWidth', 2)
hold off
title('CDFs of Random Variables')
