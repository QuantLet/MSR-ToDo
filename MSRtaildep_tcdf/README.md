[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSRtaildep_tcdf** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet: MSRtaildep_tcdf 

Published in: Measuring Statistical Risk

Description: 'Estimates tail dependence coefficient for two stocks when the joint distribution is modeled with bivariate t-Student distribution. '

Author: Barbara Choros-Tomczyk

Keywords: t-distribution, tail area (of a distribution), tail, dependence, distribution

See also: MSRtailGPareto, MSRtailHill, MSRtaildepVsVarIndex


```

### MATLAB Code
```matlab


function MSRtaildep_tcdf
clc;
close all;
x1     = load('BMW9906_standLogRet.dat');
x2     = load('Vow9906_standLogRet.dat');
lambda = taildep_tcdf(x1, x2)

x1     = load('Sie9906_standLogRet.dat');
x2     = load('Vow9906_standLogRet.dat');
lambda = taildep_tcdf(x1, x2)

x1     = load('Bay9906_standLogRet.dat');
x2     = load('Sie9906_standLogRet.dat');
lambda = taildep_tcdf(x1, x2)


function lambda = taildep_tcdf(x, y);
    tau    = corr(x, y, 'type', 'Kendall');
    rho    = sin(pi*tau/2);
    a      = DoFest(x, y);%variation index for bivariate t-distribution
    upbond = fun(rho);
    p      =  quad(@myfun, 0, upbond, [], [], a);
    q      =  quad(@myfun, 0, 1, [], [], a);
lambda = p/q;

function y  =  myfun(x, a) 
    y = x.^a./sqrt(1 - x.^2);

function h = fun(r)
    h = (1 + ((1-r)^2/(1 - r^2)))^(-1/2);
    function dof = DoFest(x1, x2);
R = [x1, x2];

for i = 3:30
    q(i-2) = sum(sum(log(tpdf(R, i))));
end;

maks = max(q);
dof  = find(q == maks)+ 2 ;
```

automatically created on 2018-05-28