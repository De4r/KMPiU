function dA = macmas(t, y)

dx1 = y(1); % x'
x1 = y(2); % x

m = 5; b = 5; k = 1000; g = 9.81;

Mg = [m, 0; 0, 1]; % macierz mas
Qx1 = -b*dx1 - k*x1 -m*g; % macierz sztywnosci
Q = [Qx1; dx1];
dA = Mg \ Q;