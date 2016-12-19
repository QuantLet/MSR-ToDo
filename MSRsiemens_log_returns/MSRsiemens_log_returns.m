
x = load('siemens_log_returns.dat');
plot(x(:, 2))
xlim([-1 length(x)+1])
ylim([-0.15 0.15])
title('Daily Log-Returns of Siemens')