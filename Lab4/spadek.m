function dQ = spadek(t,Q, A)

g=9.81;

Cd=0.5;
m=80;
A=0.25;
if t>50 & t<=60
    A = A+(t-50);
elseif t>=60
    A = A+10
end
r0 = 1.2255;
ro = r0*(1 - Q(2)/44300)^4.256;

M=[m, 0; 0, 1;];
W = [-m*g+0.5*ro*(Q(1))^2*A*Cd;
    Q(1);];

dQ=M\W;