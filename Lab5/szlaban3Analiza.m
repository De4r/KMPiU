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
    y0 = [0, 0, pi/2, 0];
end

[t,y] = ode45(@(t,x) szlaban3(t,x,pocz), tr, y0);
y1 = y(:,[2,4]) + y(:,[1,3])*2*l;
y(:,[1,3]) = rad2deg(y(:,[1,3]));

figure(21)
subplot(211)
plot(t,y(:,1))
xlabel('Czas[s]')
title('Predkosci kat. dla \phi, War. 3 (\phi, y)')
ylabel('Predkosc katowa [\circ/s]')
grid on
subplot(212)
plot(t,y(:,3))
title('Przemiesz. kat. dla \phi, War. 3 (\phi, y)')
xlabel('Czas[s]')
ylabel('Przemieszczenie katowe [\circ]')
grid on

figure(22)
subplot(211)
plot(t,y(:,2))
title('Predkosci dla y, War. 3 (\phi, y)')
xlabel('Czas[s]')
ylabel('Predkosc  [m/s]')
grid on
subplot(212)
plot(t,y(:,4))
title('Przemieszczenie dla y, War. 3 (\phi, y)')
xlabel('Czas[s]')
ylabel('Przemieszczenie  [m]')
grid on



figure(23)
subplot(211)
plot(t,y1(:,1))
title('Predkosci dla sumy przemieszczeñ, War. 3 (\phi, y)')
xlabel('Czas[s]')
ylabel('Predkosc  [m/s]')
grid on
subplot(212)
plot(t,y1(:,2))
title('Przemieszczenie dla sumy przemieszczeñ, War. 3 (\phi, y)')
xlabel('Czas[s]')
ylabel('Przemieszczenie  [m]')
grid on

