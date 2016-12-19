
x       =load('fx_dem_gbp_usd.dat');
returns =diff(log(x)); 
t       = 23:4*257:length(x);

scatter(returns(:, 1), returns(:, 2), 'b', '.')
title('FX Log-Returns')
xlabel('DEM/USD');
ylabel('GBP/USD');
xlim([-0.045 0.04])
ylim([-0.045 0.04])
