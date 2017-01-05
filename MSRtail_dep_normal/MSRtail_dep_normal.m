
function MSRtail_dep_normal
close all
rho = -0.8:0.2:0.8;
n   = length(rho);

for i = 1:n
    v      = 0.5:0.01:1;
    sigma  = 1-rho(i)^2;
    sigma  = sqrt(sigma);
    lambda = 2*(1 - normcdf(norminv(v)*sqrt(1 - rho(i))/sqrt(1 + rho(i))));

%lambda
hold on
plot(v, lambda, 'k');
hold off
text(0.55, 0.4, 'rho=-0.8')
text(0.8, 0.7, 'rho=0.6')
text(0.86, 0.75, 'rho=0.8')
xlabel('v')
ylabel('lambda_U(v)')
end