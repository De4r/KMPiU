clc
clear all

t0 = 0;
tk = 100;
N =100001;
t = linspace(t0, tk, N);

X0 = [0, 0, 0, 10]; %dx x dq q

[t, y] = ode45('chwytak', t, X0);

figure(1)
subplot(221)
plot(t,y(:,1))
xlabel('czas [s]')
ylabel('Predko�� [m/s]')
title('Przebieg czasowy pr�dko�ci trzepienia')
grid on
subplot(222)
plot(t,y(:,2))
xlabel('czas [s]')
ylabel('Przemieszczenie [m]')
title('Przebieg czasowy przemieszczenia trzepienia')
grid on
subplot(223)
plot(t,y(:,3))
xlabel('czas [s]')
ylabel('Prad [A]')
title('Przebieg czasowy pr�du w obwodzie')
grid on
subplot(224)
plot(t,y(:,4))
xlabel('czas [s]')
ylabel('�adunek [C]')
title('Przebieg czasowy �adunku w obwodzie')
grid on