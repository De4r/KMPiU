clc
clear all

t0=0;
tk=100;
n=10000;

tr = linspace(t0,tk,n);
y0=[0,0];
[t,y] = ode45('szlaban',tr,y0);
y = rad2deg(y);
figure(1)
subplot(211)
plot(t,y(:,1))
xlabel('Czas[s]')
ylabel('Predkosc katowa [st/s]')
grid on
subplot(212)
plot(t,y(:,2))
xlabel('Czas[s]')
ylabel('Przemieszczenie katowe [st]')
grid on