[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSRlambda_smoothing_utd** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet: MSRlambda_smoothing_utd

Published in: Measuring Statistical Risk

Description: 'Calculates upper tail dependence for various thresholds k for any combination of BMW, Siemens, VW and Bayer based on data from 1999 to 2006.'

Author: Barbara Choros

Keywords: smoothing, financial, time-series, tail, dependence

Submitted: Thu, March 31 2011 by Maria Osipenko

```

### MATLAB Code
```matlab


function MSRlambda_smoothing_utd
close all;
clc;
x1      = load('BMW9906_standLogRet.dat');
x2      = load('Vow9906_standLogRet.dat');
lambdaU = lambda_smoothing_utd(x1, x2)
save('lambdaS_BmwVow1.txt', 'lambdaU', '-ascii');

x1      = load('Sie9906_standLogRet.dat');
x2      = load('Vow9906_standLogRet.dat');
lambdaU = lambda_smoothing_utd(x1, x2)
save('lambdaS_SieVow1.txt', 'lambdaU', '-ascii');

x1      = load('Bay9906_standLogRet.dat');
x2      = load('Sie9906_standLogRet.dat');
lambdaU = lambda_smoothing_utd(x1, x2)
save ('lambdaS_BaySie1.txt', 'lambdaU', '-ascii');

function x = lambda_smoothing_utd(u, v);
T  = length(u);
s1 = tiedrank(u);
s2 = tiedrank(v);
for k = 1:T-1
C = sum((s1 > (T - k)).*(s2 > (T - k)));
x(k) = C/k;
end
n     = size(x, 2);
[b, n] = bandwith(0.005, n);
x     = x(1:n);
x     = smoothn(x, b, 'box');
function [b, n] = bandwith(alpha, n)
b = floor(alpha*n);
if mod(b, 2) == 0
    odd = 799:400:4799;
    f   = find(odd<n);
    m   = odd(f);
    n   = m(end);
end
b = floor(alpha*n);
```

automatically created on 2018-05-28