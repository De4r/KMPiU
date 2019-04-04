function dQ = szlaban(t,Q)

dfi=Q(1);
fi=Q(2);

k=5000;
m1=15;
m2=1;
b=30000;
g=9.81;
e=0.1; l=3.5/4;

if fi>=0 && fi<pi/2
    Mel = 400;
else
    Mel = -sign(dfi)*400;
end

    
J = [16/3*m1*l^2+1/3*m2*e^2, 1];
M = diag(J);

W = [Mel+1/2*m2*g*e*cos(pi/4-fi)-m1*g*2*l*cos(fi)-k*e^2*cos(fi)*sin(fi)-b*e^2*(cos(fi))^2*dfi;
    dfi];


dQ = M \ W;