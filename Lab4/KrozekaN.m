clc
clear all

t0=0;
tk=100;
n=1000;

tr = linspace(t0,tk,n);
y0=[0,0,0,0];
[t,y] = ode45('krazek2',tr,y0)

figure(1)
subplot(211)
plot(t,y(:,1))
xlabel('Czas[s]')
ylabel('Predkosc [m/s]')
grid on
subplot(212)
plot(t,y(:,2))
xlabel('Czas[s]')
ylabel('Predkosc katowa [m/s]')
grid on
figure(2)
subplot(211)
plot(t,y(:,3))
xlabel('Czas[s]')
ylabel('Przemeiszcenie [m]')
grid on
subplot(212)
plot(t,y(:,4))
xlabel('Czas[s]')
ylabel('Przemeiszcenie katowe [rad]')
grid on