clc
clear all

t1=0;
t2=500;
k=100000;
t= linspace(t1, t2, k); % wektor czasu
y0=[0, 0, 0, 0]; % warunki zerowe

[x y] = ode45('macmas2', t, y0);

figure(1)
subplot(211)
plot(t, y(:,1))
xlabel('Czas [s]')
ylabel('Predkoœæ [m/s]')
legend('Predkoœæ - dx1')
grid on

subplot(212)
plot(t, y(:,2))
xlabel('Czas [s]')
ylabel('Predkoœæ [m/s]')
legend('Predkoœæ - dx2')
grid on

figure(2)
subplot(211)
plot(t, y(:,3))
legend('Przemieszczenie - x1')
xlabel('Czas [s]')
ylabel('Przemieszczenie [m]')
grid on
subplot(212)
plot(t, y(:,4))
legend('Przemieszczenie - x2')
xlabel('Czas [s]')
ylabel('Przemieszczenie [m]')
grid on