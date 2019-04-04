clc
clear all

t1=0;
t2=20;
k=1000;
t= linspace(t1, t2, k); % wektor czasu
y0=[0, 5]; % warunki zerowe

[x y] = ode45('macmas', t, y0);

figure(1)
subplot(211)
plot(t, y(:,1))
xlabel('Czas [s]')
ylabel('Predkoœæ [m/s]')
legend('Predkoœæ - dx')
grid on

subplot(212)
plot(t, y(:,2))
legend('Przemieszczenie - x')
xlabel('Czas [s]')
ylabel('Przemieszczenie [m]')
grid on