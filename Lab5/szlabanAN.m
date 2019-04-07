clc
clear all

t0=0;
tk=4;
n=2000;
l=0.5;
tr = linspace(t0,tk,n);

pocz = 1;
if pocz==1
    y0=[0,0];
elseif pocz==0
    y0 = [0, pi/2];
end

[t,y] = ode45(@(t,x) szlaban(t,x,pocz), tr, y0);
yy = y*2*l;

y = rad2deg(y);
figure(3)
subplot(211)
plot(t,y(:,1))
xlabel('Czas[s]')
ylabel('Predkosc katowa [\circ/s]')
grid on
subplot(212)
plot(t,y(:,2))
xlabel('Czas[s]')
ylabel('Przemieszczenie katowe [\circ]')
grid on

figure(4)
subplot(211)
plot(t,yy(:,1))
xlabel('Czas[s]')
ylabel('Predkosc katowa [\circ/s]')
grid on
subplot(212)
plot(t,yy(:,2))
xlabel('Czas[s]')
ylabel('Przemieszczenie katowe [\circ]')
grid on