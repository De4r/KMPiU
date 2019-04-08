function dQ = szlaban3(t, Q, pocz)

dfi=Q(1);
vy=Q(2);
fi=Q(3);
y=Q(4);

k=2000;
m1=10;
m2=2;
b=20000;
g=9.81;
e=0.1; l=2/4;
kr = 200000;
br = 2000;
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
    
diagonala = [16/3*m1*l^2+1/3*m2*e^2+m1*4*l^2, m1, 1, 1];
M = diag(diagonala);
M(2,1) = -m1*2*l;
M(1,2) = -m1*2*l;

W = [-k*e^2*sin(pi/4-fi)*cos(pi/4-fi) - b*e^2*dfi*(cos(pi/4 - fi))^2 + Me + m2*g*e/2*cos(pi/4-fi) - m1*g*2*l*cos(fi);
    -kr*y + m1*g*cos(fi) - br*vy;
    dfi;
    vy];


dQ = M \ W;