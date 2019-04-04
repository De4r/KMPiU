function dQ = krazek2(t,Q)
dx=Q(1);
dfi=Q(2);
x=Q(3);
fi=Q(4);

k=2000;
R=1;
m1=100;
m2=10;
g=9.81;
Mk=m1*g*R+0.001;
diagm = [m1, 1/2*m2*R^2, 1, 1];
M = diag(diagm);

W = [m1*g-k*(x-R*fi);
    R*k*(x-R*fi)-Mk;
    dx;
    dfi;];



dQ = M \ W;