% ---------------------------------------------------------------------
% Book:         SFE
% ---------------------------------------------------------------------
% Quantlet:     MSRevt1
% ---------------------------------------------------------------------
% Description:  MSRevt1 computes and displays extreme value 
%               distributions: Frechet, Gumbel and Weibull. 
% ---------------------------------------------------------------------
% Usage:        MSRevt1
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Extreme value distribution pdfs.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Juergen Franke 20030501
% ---------------------------------------------------------------------


clear
n = 100;
sp= 5;
xpos = sp*(1:n)/n;
xneg = -sp + xpos;
x = [xneg,xpos]';

alpha=1/2;
gumb=[x gevpdf(x)];
frec=[x gevpdf(x,alpha,0.5,1)];
weib=[x gevpdf(x,-alpha,0.5,-1)];

hold on
plot(gumb(:,1),gumb(:,2),'k','LineWidth',2,'LineStyle','-')
plot(frec(:,1),frec(:,2),'r','LineWidth',2,'LineStyle',':')
plot(weib(:,1),weib(:,2),'b','Linewidth',2,'LineStyle','-.')
title('Extreme Value Densities')
xlabel('X')
ylabel('Y')
hold off