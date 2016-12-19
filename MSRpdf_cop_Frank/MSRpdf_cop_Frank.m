
function MSRpdf_cop_Frank
[u,v] = meshgrid(0:0.02:1);
p     = 2;

gcopuly = -p.*(exp(-p.*(u+v+1)) - exp(-p.*(u+v)))./...
    ((exp(-p) + exp(-p.*(u+v)) - exp(-p.*u) - exp(-p.*v)).^2);
grid on

mesh(u, v, gcopuly)
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Frank Copula Density, \\theta = 2')