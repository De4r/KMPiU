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
    y01 = [0, 0, 0 ,0];
elseif pocz==0
    y0 = [0, pi/2];
    y01 = [0, 0, pi/2 ,0];
end

[t,y] = ode45(@(t,x) szlaban(t,x,pocz), tr, y0);
[t, y1] = ode45(@(t,x) szlaban2(t,x,pocz), tr, y01);
yy = y*2*l;

y = rad2deg(y);
y1(:,[1,3]) = rad2deg(y1(:,[1,3]));

figure(1)
subplot(211)
plot(t,y(:,1), t, y1(:,1))
xlabel('Czas[s]')
ylabel('Predkosc katowa [\circ/s]')
grid on
subplot(212)
plot(t,y(:,2), t, y1(:,3))
xlabel('Czas[s]')
ylabel('Przemieszczenie katowe [\circ]')
grid on

figure(2)
subplot(211)
plot(t,yy(:,1), t, y1(:,2))
xlabel('Czas[s]')
ylabel('Predkosc [m/s]')
grid on
subplot(212)
plot(t,yy(:,2), t, y1(:,4))
xlabel('Czas[s]')
ylabel('Przemieszczenie [m]')
grid on