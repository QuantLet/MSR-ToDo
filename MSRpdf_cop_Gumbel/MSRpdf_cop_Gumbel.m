
function MSRpdf_cop_Gumbel

[u,v]   = meshgrid(0:0.02:1);
p       = 2;
arg     = (-log(u)).^p + (-log(v)).^p;
gcopuly = exp(-arg.^(1/p))./u./v.*(log(u).*log(v)).^(p-1).*...
    arg.^(1/p-2).*(p-1 + arg.^(1/p));
grid on

mesh(u, v, gcopuly)

xlabel('X');
ylabel('Y');
zlabel('Z');
title('Gumbel Copula Density, \\theta = 2')