function dX=krazek(t, X)

dfi = X(1);
fi = X(2);

Jo = 1; % kgm^2
m = 2; %kg
R = 0.5; %m
r = 0.25; %m
k = 12343; %N/m
b = 33;

M = [Jo+m*R.^2, 0;0, 1];
wyrazWolny = [-k*fi*(R+r).^2 - b*dfi*4*R.^2; dfi];

dX = M \ wyrazWolny;