
x1 = load('Bay9906_standLogRet.dat');
x2 = load('BMW9906_standLogRet.dat');
x3 = load('Sie9906_standLogRet.dat');
x4 = load('Vow9906_standLogRet.dat');

figure(1);plot(x1);ylim([-6 8]);title('Daily Standardized Log-Returns of Bayer');
figure(2);plot(x2);ylim([-6 8]);title('Daily Standardized Log-Returns of BMW');
figure(3);plot(x3);ylim([-6 8]);title('Daily Standardized Log-Returns of Siemens');
figure(4);plot(x4);ylim([-6 8]);title('Daily Standardized Log-Returns of Volkswagen');
