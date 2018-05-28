[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSRfibonacci** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet: MSRfibonacci

Published in: Measuring Statistical Risk

Description: 'Generates numbers coming from a uniform distribution. The function uses Fibonacci method.'

Keywords:  Fibonacci, random, random-number-generation, random-number-generation, uniform, distribution

Author: Zografia Anastasiadou

```

![Picture1]( MSRfibonacci.png)

### R Code
```r

rm(list = ls(all = TRUE))
#setwd("C:/...")

# input parameters
nn    =  18
a     =  1366
b     =  150889
M     =  714025
seed  =  1234567
n     =  10000

# main computation
yy     =  1:nn
yy[1]  =  seed
i      =  2
while (i <= nn) {
    yy[i] = (a * yy[i - 1] + b)%%M
    i     = i + 1
}
yy = yy/M
y1 = yy

y = y1[1:18]
i = 19
while (i <= n + 18) {
    zeta = y[i - 17] - y[i - 5]
    zeta = (zeta + 1) * (zeta < 0) + (zeta * (zeta >= 0))
    y[i] = zeta
    i    = i + 1
}
y = y[19:(n + 18)]

# output
plot(y[1:(n - 2)], y[2:(n - 1)], pch = 20, cex = 0.5, 
    col = "blue", xlab = "Ui-1", ylab = "Ui")
```

automatically created on 2018-05-28

### MATLAB Code
```matlab

% input parameters
nn   = 18;
a    = 1366;
b    = 150889;
M    = 714025;
seed = 1234567;
n    = 10000;

% main computation
yy(1) = seed;
i = 2;
while(i <= nn)
    yy(i) = mod((a*yy(i - 1) + b), M);
    i = i + 1;
end
yy = yy/M;
y1 = yy;

y  = y1(1:18);
i  = 19;

while (i <= n + 18)
    zeta = y(i - 17) - y(i - 5);
    zeta = (zeta + 1).*(zeta < 0) + zeta.*(zeta >= 0);
    y(i) = zeta;
    i = i + 1;
end

y = y(19:n+18);

% output
scatter(y(1:n-2), y(2:n-1), 'b', '.')
xlabel('U_i_-_1')
ylabel('U_i')


```

automatically created on 2018-05-28