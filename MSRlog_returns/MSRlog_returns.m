
x       = load('fx.dat');
returns = diff(log(x)); 
t       = 23:4*257:length(x);

subplot(2, 1, 1)
plot(returns(:, 1))
set(gca, 'XTick', t);
set(gca, 'XTickLabel', {'1980' '1984' '1988' '1992'})
xlim([-1 length(x) + 1])
ylim([-0.05 0.05])
title('Log returns DEM/USD')
subplot(2, 1, 2)
plot(returns(:, 2))
set(gca, 'XTick', t);
set(gca, 'XTickLabel', {'1980' '1984' '1988' '1992'})
xlim([-1 length(x) + 1])
ylim([-0.05 0.05])
title('Log returns GBP/USD')