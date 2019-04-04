function dX = chwytak(t, X)

dx = X(1);
x = X(2);
dq = X(3);
q = X(4);
% S - [m^2], m - [kg] A - , B - Pa, h - [m], R - Ohm, k - N/m
S1 = 0.3; S2 = 0.5; S3 = 0.5; m1 = 100; m2 = 2; m3 = 60; A = 10;
B = 2000; h = 0.05; R = 10000; k = 10000;

F =100+ 10*sin(3*t);%100 N i oscylacja nacisku
x0=0.1; % wstepne wychylenie 10 cm
U = 24; % napiecie 24V

diagm =[m1+m2*(S1/S2).^2+m3*(S1/S3).^2, 1, A/(h+x), 1];
M = diag(diagm);

Qdx = -k*(S1/S3).^2*(x - x0) - B*dx*S1 - A*dq.^2/(2*(h+x).^2)+F*S1/S3;
Qx = dx;
Qdq = U - R*dq + A/((h+x).^2)*dq*dx;
Qq = dq;
Q = [Qdx; Qx; Qdq; Qq];

dX = M \ Q;