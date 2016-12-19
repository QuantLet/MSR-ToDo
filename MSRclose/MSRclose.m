x1=load('BAYER_close_99_06.dat');
x2=load('BMW_close_99_06.dat');
x3=load('SIEMENS_close_99_06.dat');
x4=load('VOLKSWAGEN_close_99_06.dat');

hold on
plot(x1(:,2),'k','LineStyle','--')
plot(x2(:,2),'r','LineStyle',':')
plot(x3(:,2),'b','LineStyle','-')
plot(x4(:,2),'g','LineStyle','-.')
xlim([0 length(x1)])
title('Closing Prices for German Companies')
hold off