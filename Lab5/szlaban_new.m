function dQ = szlaban_new(t, Q, pocz)

dfi=Q(1);
fi=Q(2);

k=2000; m1=6; m2=1; m3 =3; b=7000; g=9.81; e=0.15; l=2/4;
Me = 100;

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
    
J = [(16*m1*l^2+m2*e^2+m3*e^2*(sin(pi/4-fi))^2)/3, 1];
M = diag(J);

F = -k*e^2*sin(pi/4-fi)*(cos(pi/4-fi)-cos(pi/4)) -...
    b*e^2*dfi*(sin(pi/4 - fi))^2 + Me + (m2/2+m3)*g*e*cos(pi/4-fi) -...
    m1*g*2*l*cos(fi) + 2*m3*e^2*(dfi^2)*sin(pi/4-fi)*cos(pi/4-fi);

W = [F;
    dfi];

dQ = M \ W;