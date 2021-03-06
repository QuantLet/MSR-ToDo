
x    = load('Portf9206_logRet.dat');
n    = length(x);
xf   = sort(x);

t    = (1:n)/(n+1);
dat  = [normcdf((xf-mean(xf))/sqrt(var(xf))),t'];
dat2 = [t',t'];

hold on
figure(1)
scatter(dat(:, 1), dat(:,2), '.', 'b')
plot(dat2(:, 1), dat2(:, 2), 'r', 'LineWidth', 2)
title('PP Plot of Daily Return of Portfolio')
hold off

figure(2)
h = qqplot(xf)
set(h(1), 'Marker', '.')
set(h(3), 'LineStyle', '-')
set(h(3), 'LineWidth', 2)
title('QQ Plot of Daily Return of Portfolio')
xlabel('')
ylabel('')

