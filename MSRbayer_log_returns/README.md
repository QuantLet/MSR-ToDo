[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSRbayer_log_returns** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet: MSRbayer_log_returns

Published in: Measuring Statistical Risk

Description: 'Plots daily log-returns of the Bayer stock from 1992-01-01 to 2006-12-29.'

Keywords: financial, returns, time-series, log-returns, plot

See also: 'MSRportfolio_est, MSRstdlogret, MSRtail_dep_normal, MSRtail_dep_tStudent, MSRvar_block_max, MSRvar_block_max_params, MSRvar_clayton_GARCHn'

Author: 'Barbara Choros-Tomczyk , Wolfgang K. Härdle'

Datafiles: bayer_log_returns.dat

Submitted: Wed, November 18 2009 by Lasse Groth

```

![Picture1](MSRbayer_log_returns.png)

### MATLAB Code
```matlab

clear
clc 
close all

x = load('bayer_log_returns.dat');
plot(x(:, 2))
xlim([-1 length(x) + 1])
ylim([-0.15 0.15])
title('Daily log-returns of Bayer')
```

automatically created on 2018-05-28