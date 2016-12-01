
x = load('Portf9206_logRet.dat');
x = x/100;
plot(x);
xlim([-1 length(x)+1])
title('Daily Log-Returns of Portfolio')
