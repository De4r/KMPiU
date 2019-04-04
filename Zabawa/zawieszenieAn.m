clc
clear all

t0=0;
tk=10;
N =100001;
t = linspace(t0, tk, N);

X0= [0, pi/3, 0, pi/6]; %dfi1 fi1 dfi2 fi2

[t, y] = ode45('zawieszenie', t, X0);

figure(1)
subplot(221)
plot(t,y(:,1))
xlabel('czas [s]')
ylabel('Predkoœæ katowa [rad/s]')
title('Przebieg czasowy prêdkoœci katowej')
grid on
subplot(222)
plot(t,y(:,2))
xlabel('czas [s]')
ylabel('Przemieszczenie [rad]')
title('Przebieg czasowy przemieszczenia k¹towego')
grid on
subplot(223)
plot(t,y(:,3))
xlabel('czas [s]')
ylabel('Predkoœæ katowa [rad/s]')
title('Przebieg czasowy prêdkoœci katowej')
grid on
subplot(224)
plot(t,y(:,4))
xlabel('czas [s]')
ylabel('Przemieszczenie [rad]')
title('Przebieg czasowy przemieszczenia k¹towego')
grid on