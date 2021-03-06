clc
clear all

t0=0;
tk=4;
n=2000;

tr = linspace(t0,tk,n);
l= 0.5;
pocz = 0;
if pocz==1
    y0=[0,0,0,0];
elseif pocz==0
    y0 = [0, 0, pi/2, pi/2*2*l];
end

[t,y] = ode45(@(t,x) szlaban2(t,x,pocz), tr, y0);
y1 = y(:,[2,4]) - y(:,[1,3])*2*l;
y(:,[1,3]) = rad2deg(y(:,[1,3]));

figure(1)
subplot(211)
plot(t,y(:,1))
xlabel('Czas[s]')
title('Predkosci kat. dla \phi, War. 2 (\phi -y)')
ylabel('Predkosc katowa [\circ/s]')
grid on
subplot(212)
plot(t,y(:,3))
xlabel('Czas[s]')
title('Przemiesz. kat. dla \phi, War. 2 (\phi -y))')
ylabel('Przemieszczenie katowe [\circ]')
grid on

figure(2)
subplot(211)
plot(t,y(:,2))
xlabel('Czas[s]')
ylabel('Predkosc  [m/s]')
title('Predkosci dla y, War. 2 (\phi-y)')
grid on
subplot(212)
plot(t,y(:,4))
xlabel('Czas[s]')
ylabel('Przemieszczenie  [m]')
title('Przemieszczenie dla y, War. 2 (\phi-y)')
grid on


figure(3)
subplot(211)
plot(t,y1(:,1))
xlabel('Czas[s]')
title('Przedkosc dla \phi*2l-y, War. 2 (\phi-y)')
ylabel('Predkosc  [m/s]')
grid on
subplot(212)
plot(t,y1(:,2))
xlabel('Czas[s]')
ylabel('Przemieszczenie  [m]')
title('Przemieszczenie dla \phi*2l-y, War. 2 (\phi-y)')
grid on

