function [par, cord] = coordinatesModel(zs,zu)
% wyznacza wspó³rzêdne uk³adu na podstawie:
% zs - przemieszczenie samochodu z Z,
% zr - przemieszczenie srodka ko³a na Z.
%
% Zwraca:
% parametry : [zs, zu, yu, fi, theta]
% macierz - cord = [[ Y Y Y Y ..]
%                   [ Z Z Z Z ..]]

% Wspolrzedne punktów:
yoZero = 0; zoZero = 0; xoZero = 0;
yaZero = 300; zaZero = 600; xaZero = 35; %0
ybZero = 300; zbZero = 150; xbZero = 5; %0
ycZero = 350; zcZero = 125; xcZero = -15; %0
ydZero = 350; zdZero = -25; xdZero = -35; %0
yeZero = 325; zeZero = -50; xeZero = -31; %0
yuZero = 450; zuZero = 50; xuZero = -35; %0

% wyznaczenie pomocniczych parametrów:
a = yuZero - ybZero;
b = zu - zs - zaZero + zeZero;
c = ybZero - yeZero - yaZero;
d = yuZero - yeZero;
e = zeZero + zu;
Lw = sqrt((yeZero)^2+(zeZero)^2); % d³ wahacza w p³asz. Z Y

% wyznaczenie fi, yu, theta
if zs==8+zu
    fi=0; yu=0;
    theta = asin((fi*d+e-zs)/Lw)
else
    fi = (-1*(-2*b*c+2*d*e)+sqrt((-2*b*c+2*d*e)^2-4*(b^2+d^2)*(c^2+e^2+Lw^2)))/(2*(b^2+d^2))
    yu = sqrt(Lw^2-(fi*d+e)^2) - yeZero + fi*(zuZero - zeZero)
    theta = asin((fi*d+e-zs)/Lw)
end

fi = real(fi); theta = real(theta); yu = real(yu);
% wyznaczenie wszystkich punktow
d11 = yuZero + yu - (yuZero - fi*zuZero);
d21 = zuZero + zu - (fi*yuZero + zuZero);
% macierz transformacji
D = [1 -fi d11; fi 1 d21; 0 0 1];

wspol = D * [ybZero, ydZero, yeZero, ycZero; zbZero, zdZero, zeZero, zcZero; 1, 1, 1, 1];

yb = wspol(1,1); zb = wspol(2,1);
yd = wspol(1,2); zd = wspol(2,2);
ye = wspol(1,3); ze = wspol(2,3);
yc = wspol(1,4); zc = wspol(2,4);
yo = yoZero + 0; zo = zoZero + zs;
ya = yaZero + 0; za = zaZero + zs;
yup = yuZero + yu; zup = zuZero + zu;

cord = [yo, ya, yup, yb, yd, ye, yc;zo, za, zup, zb, zd, ze, zc; xoZero, xaZero, xuZero, xbZero, xdZero, xeZero, xcZero];
par = [ zs, zu, yu, fi ,theta];

end
