clc
clear all

t0 = 0;
tk = 1;
N = 1001;
t = linspace(t0, tk, N);

X0= [0, 0.1]; %dfi fi

[t, y] = ode45('krazek', t, X0);

figure(1)
subplot(211)
plot(t,y(:,1))
xlabel('czas [s]')
ylabel('Predkoœæ katowa [rad/s]')
title('Przebieg czasowy prêdkoœci katowej')
grid on
subplot(212)
plot(t,y(:,2))
xlabel('czas [s]')
ylabel('Przemieszczenie [rad]')
title('Przebieg czasowy przemieszczenia katowego')
grid on