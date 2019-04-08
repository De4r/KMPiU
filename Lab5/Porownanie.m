clc
clear all

t0=0;
tk=4;
n=2000;
l=0.5;
tr = linspace(t0,tk,n);

pocz = 0;
if pocz==1
    y0=[0,0];
    y01 = [0, 0, 0 ,0];
    y02 = [ 0, 0, 0, 0];
elseif pocz==0
    y0 = [0, pi/2];
    y01 = [0, 0, pi/2, pi/2*2*l];
    y02 = [0, 0, pi/2, 0];
end

[t,y] = ode45(@(t,x) szlaban(t,x,pocz), tr, y0);
[t, y1] = ode45(@(t,x) szlaban2(t,x,pocz), tr, y01);
[t, y2] = ode45(@(t,x) szlaban3(t,x,pocz), tr, y02);
yy = y*2*l; % przemieszczenie srodka belki od fi
yy2 = y2(:,[1,3])*2*l;
y = rad2deg(y);
y1(:,[1,3]) = rad2deg(y1(:,[1,3]));
y2(:,[1,3]) = rad2deg(y2(:,[1,3]));

figure(5)
subplot(211)
plot(t,y(:,1), t, y1(:,1), t, y2(:,1))
xlabel('Czas[s]')
ylabel('Predkosc katowa [\circ/s]')
legend('W1', 'W2', 'W3')
grid on
subplot(212)
plot(t,y(:,2), t, y1(:,3), t, y2(:,3))
xlabel('Czas[s]')
ylabel('Przemieszczenie katowe [\circ]')
legend('W1', 'W2', 'W3')
grid on

figure(6)
subplot(211)
plot(t,yy(:,1), t, y1(:,2), t, y2(:,2)+yy2(:,1))
xlabel('Czas[s]')
ylabel('Predkosc [m/s]')
legend('W1', 'W2', 'W3')
grid on
subplot(212)
plot(t,yy(:,2), t, y1(:,4), t, y2(:,4)+yy2(:,2))
xlabel('Czas[s]')
ylabel('Przemieszczenie [m]')
legend('W1', 'W2', 'W3')
grid on