function dQ = szlaban(t, Q, pocz)

dfi=Q(1);
fi=Q(2);

k=2000;
m1=10;
m2=2;
b=20000;
g=9.81;
e=0.1; l=2/4;

Me = 300;
if pocz==1
    if fi>= 0 && fi< pi/2
        Me = Me;
    elseif fi > pi/2
        Me = -Me;
    end
elseif pocz==0
    if fi <= pi/2 && fi > 0
        Me = -Me;
    elseif fi < 0
        Me = Me;
    end
end
    

    
J = [16/3*m1*l^2+1/3*m2*e^2, 1];
M = diag(J);

W = [-k*e^2*sin(pi/4-fi)*cos(pi/4-fi) - b*e^2*dfi*(cos(pi/4 - fi))^2 + Me + m2*g*e/2*cos(pi/4-fi) - m1*g*2*l*cos(fi);
    dfi];


dQ = M \ W;