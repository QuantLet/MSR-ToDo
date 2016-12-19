function MSRvar_block_max_params
clc;
close all;
k = load('kappa_bMax_Portf.txt', '-ascii');
a = load('alpha_bMax_Portf.txt', '-ascii');
b = load('beta_bMax_Portf.txt', '-ascii');
%^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^PLOTS
plot(k)
grid on
hold on
plot(a,'Color', 'red')
plot(b,'Color', 'm');
hold off
legend('Shape Parameter','Scale Parameter','Location Parameter')
title('Parameters in Block Maxima Model')
xlim([-3 1755])%xlim([-1.5 1752])
set(gca,'XTick',[261 521 782 1043 1304 1566 1826]-250)
set(gca,'XTickLabel',{'Jan 2000' 'Jan 2001' ...
   'Jan 2002' 'Jan 2003' 'Jan 2004' 'Jan 2005' 'Jan 2006'})