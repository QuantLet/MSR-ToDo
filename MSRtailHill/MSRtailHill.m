
function MSRtailHill
clc
close all
a      = load('Bay9906_close_2kPoints.txt','-ascii');
b      = load('Bmw9906_close_2kPoints.txt','-ascii');
c      = load('Sie9906_close_2kPoints.txt','-ascii');
d      = a + b + c;
x      = log(d(1:end-1)./d(2:end)); %negative log-returns
n      = length(x);
x      = sort(x,'descend');
k      = 100;
x      = x(1:k,:);
gammaH = mean(log(x))-log(x(k))
alphaH = (mean(log(x))-log(x(k)) )^(-1)
sigmaH = x(k)*(k/n)^(1/alphaH)