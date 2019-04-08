function dQ = szlaban_new(t, Q, pocz)

dfi=Q(1);
fi=Q(2);

k=2000;
m1=10;
m2=2;
m3 =5;
b=20000;
g=9.81;
e=0.1; l=2/4;

Me = 200;
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
% if pocz==1
%     if fi>= 0 && fi< pi/3
%         Me = Me*0.8;
%     elseif fi >= pi/3 && fi < pi/2
%         Me = Me*fi*(1-fi/pi/2);
%     elseif fi > pi/2
%         Me = -Me*0.2;
%     end
% elseif pocz==0
%     if fi <= pi/2 && fi > pi/3
%         Me = -Me*fi/pi/2;
%     elseif fi <= pi/3 && fi > 0
%         Me = -Me*0.3;
%     elseif fi < 0
%         Me = Me;
%     end
% end
%     

    
J = [(16*m1*l^2+m2*e^2+m3*e^2*(sin(pi/4-fi))^2)/3, 1];
M = diag(J);

W = [-k*e^2*sin(pi/4-fi)*(cos(pi/4-fi)-cos(pi/4)) - b*e^2*dfi*(sin(pi/4 - fi))^2 + Me + (m2/2+m3)*g*e*cos(pi/4-fi) - m1*g*2*l*cos(fi) + 2*m3*e^2*(dfi^2)*sin(pi/4-fi)*cos(pi/4-fi);
    dfi];


dQ = M \ W;