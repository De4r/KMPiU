clc
clear all

t0=0;
tk=3;
n=2000;
l=0.5;
tr = linspace(t0,tk,n);

pocz = 0;
if pocz==1
    y0=[0,0];
    nazwa1='podnoszeniefi.png';
    nazwa2='podnoszeniey.png'
elseif pocz==0
    y0 = [0, pi/2];
    nazwa1='opuszczaniefi.png';
    nazwa2='opuszczaniey.png';
end

[t,y] = ode45(@(t,x) szlaban_new(t,x,pocz), tr, y0);
yy = y*4*l;

y = rad2deg(y);
figure(10)
subplot(211)
plot(t,y(:,1))
xlabel('Czas[s]')
title('Prêdkoœæ k¹towe dla \phi')
ylabel('Prêdkoœæ k¹towa [\circ/s]')
grid on
subplot(212)
plot(t,y(:,2))
xlabel('Czas[s]')
title('Przemieszczenie k¹towe dla \phi')
ylabel('Przemieszczenie k¹towe [\circ]')
grid on
saveas(gcf, nazwa1)

figure(11)
subplot(211)
plot(t,yy(:,1))
xlabel('Czas[s]')
title('Prêdkoœæ dla y=\phi*4l')
ylabel('Prêdkoœæ [m/s]')
grid on
subplot(212)
plot(t,yy(:,2))
xlabel('Czas[s]')
title('Przemieszczenie dla y=\phi*4l')
ylabel('Przemieszczenie [m]')
grid on
saveas(gcf, nazwa2)