clc
clear all

t0=0;
tk=100;
n=1000;
tr = linspace(t0,tk,n);
A=ones(size(tr))*0.25;
y0=[0,11000];
[t,y] = ode45('spadek',tr,y0);


figure(1)
subplot(211)
plot(t,y(:,1))
xlabel('Czas[s]')
ylabel('Predkosc [m/s]')
grid on
subplot(212)
plot(t,y(:,2))
xlabel('Czas[s]')
ylabel('Przemieszczenie [m]')
grid on