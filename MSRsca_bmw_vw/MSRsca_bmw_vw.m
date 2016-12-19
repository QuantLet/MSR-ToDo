x1 = load('BMW9906_standLogRet.dat');
x2 = load('Vow9906_standLogRet.dat');

scatter(x1, x2, '.')
xlabel('Standardized Log-Returns of BMW')
ylabel('Standardized Log-Returns of Volkswagen')
xlim([-6.2 7])
ylim([-5.5 5.5])