% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     MSRgpdist
% ---------------------------------------------------------------------
% Description:  MSRgpdist generates generalized Pareto densities for 
%               different shape parameters.     
% ---------------------------------------------------------------------
% Usage:        MSRgpdist
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Generalized Pareto densities.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Barbara Choros
% ---------------------------------------------------------------------

 hold on
 n = 100;
 sp= 5; 
 r=[0.5;0;-0.5];
 
 x1 = 0.001:0.05:5.001; 
 dist1 = [x1' gppdf(x1,r(1),1)'];
 plot(dist1(:,1), dist1(:,2),'b','LineStyle','-.','LineWidth',2)

 x2 = [0;(sp*(1:n)/n)'];
 dist2 = [x2,gppdf(x2,r(2),1)];
 plot(dist2(:,1), dist2(:,2),'k','LineWidth',2)

 x3 = 0.001:-1/r(3)/n:100*(-1/r(3)/n)+0.001;
 x3
 dist3 = [x3' gppdf(x3,r(3),1)'];
 plot(dist3(:,1), dist3(:,2),'r','LineStyle','--','LineWidth',2)
 
 title('Generalized Pareto Densities')
 xlim([0 5])
 hold off 