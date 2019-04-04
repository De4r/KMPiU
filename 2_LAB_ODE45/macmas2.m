function dA = macmas2(t, y)

dx1 = y(1); % x'
dx2 = y(2); % x
x1 = y(3);
x2 = y(4);
% PARAMETRY
m1 = 80; b1 = 20; k1 = 100; g = 9.81;
m2 = 80; b2 = 20; k2 = 100;
b1 = 2*sqrt(m1*k1);
b2 = 2*sqrt(m2*k2);
% 
% w01=sqrt(k1/m1);
% beta01 = b1/(2*m1);
% w1 = sqrt(w01^2+beta01^2);
% 
% f1 = 10000*sin(w01*t);
% f2 = 10000*sin(w01*t);

diagm = [m1, m2, 1, 1]; % diagonala macierzy mas
Mg = diag(diagm, 0); %macierz mas

%macierz mas
Qx1 = k1*(x2-x1) - m1*g + b1*(dx2-dx1);
Qx2 = -k1*(x2-x1) - k2*x2 - m2*g - b1*(dx2-dx1) - b2*dx2;
Q = [Qx1; Qx2; dx1; dx2];
% rozwiazanie ukladu rownan
dA = Mg \ Q;