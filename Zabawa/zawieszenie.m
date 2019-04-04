function dX=zawieszenie(t, X)

dfi1 = X(1);
fi1 = X(2);
dfi2 = X(3);
fi2 = X(4);

J1 = 10; J2 = 10.2; % kgm^2
m = 2; %kg
R = 0.5; %m
k1 = 1234443; k2 = 1231411; k = 12401; %N/m
b = 133;

diagm = [ J1, 1, J2, 1];
M = diag(diagm);

wyrazWolny = [-k1*fi1-k*R^2*(fi1-fi2) - 2*b*R^2*(dfi1-dfi2);
    dfi1;
    -k2*fi2+k*R^2*(fi1-fi2) + 2*b*R^2*(dfi1-dfi2);
    dfi2];

dX = M \ wyrazWolny;