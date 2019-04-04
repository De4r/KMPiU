function dA = macmas3(t, y)

dx1 = y(1); % x'
dx2 = y(2); % x
x1 = y(3);
x2 = y(4);
% PARAMETRY
m1 = 80; b1 = 20; k1 = 100; g = 9.81;
m2 = 80; b2 = 20; k2 = 100;

zeta1 = 0.7;
zeta2 = 0.8;

b1 = zeta1*2*sqrt(m1*k1);
b2 = zeta2*2*sqrt(m2*k2);

A = 0.15;
omega = 2;
xt = A*sin(omega*t);
dxt = A*omega*sin(omega*t);

diagm = [m1, m2, 1, 1]; % diagonala macierzy mas
Mg = diag(diagm, 0); %macierz mas

%macierz mas
Qx1 = k1*(x2-x1) - m1*g + b1*(dx2-dx1);
Qx2 = -k1*(x2-x1) - k2*(x2-xt) - m2*g - b1*(dx2-dx1) - b2*(dx2-dxt);
Q = [Qx1; Qx2; dx1; dx2];
% rozwiazanie ukladu rownan
dA = Mg \ Q;