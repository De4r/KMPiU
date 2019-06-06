function [par, cord] = coordinatesModel3(zs, zu)
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
% ycZero = 350; zcZero = 125; xcZero = -15; %0
ydZero = 320; zdZero = 50; xdZero = -35; %0ydZero = 312.5; zdZero = 75; xdZero = -35; %0 
yeZero = 325; zeZero = -50; xeZero = -31; %0
yuZero = 450; zuZero = 50; xuZero = -35; %0


Lw=sqrt((yeZero-yoZero)^2+(zeZero-zoZero)^2);

Lgy = abs(ybZero - yuZero);
Lgz = abs(zbZero - zuZero);
Ldy = abs(yeZero - yuZero);
Ldz = abs(zeZero - zuZero);
Lp = abs(ydZero - yuZero);

h=zuZero-zoZero;
lu=yuZero-yoZero;
H=zaZero-zoZero;
L=yaZero-yoZero;

a = Ldy - Lgy - L;
c = h - Ldz;
d = h - H - Ldz;
e = zu - zs + d;

%obliczenie fi

fi = (2*a*e-2*Ldy*(zu+c) - sqrt((Ldy*2*(zu+c)-2*a*e)^2-4*(e^2+Ldy^2)*((zu+c)^2-Lw^2)))/(2*(e^2+Ldy^2))

yu=sqrt(Lw^2 - (zu + h - Ldz - Ldy*fi)^2)- lu + Ldy + Ldz*fi

theta = asin((zu + h - Ldz - Ldy*fi - zs) / Lw)%+theta0


% u  - zu yu
zo=zs; yo=0;
za=zs+H; ya=L;
zub=zu+h; yub=lu+yu;

zeo = zs + Lw*sin(theta); yeo = Lw*cos(theta);
ze = zu + h - Ldz - Ldy*fi; ye = yu + lu - Ldy - Ldz*fi;
zb = zu + h + Lgz + Lgy*fi; yb = yu + lu - Lgy + Lgz*fi;

% punkt D 
zd = zu + h + Lp*fi; yd = yu + lu - Lp;

cord = [yo, ya, yub, yb, yd, ye, yeo;...
        zo, za, zub, zb, zd, ze, zeo;...
        xoZero, xaZero, xuZero, xbZero, xdZero, xeZero, xeZero];
par = [ zs, zu, yu, fi ,theta];

end