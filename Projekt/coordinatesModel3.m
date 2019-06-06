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
Ld_=abs(ydZero-yeZero);
Ld=abs(zdZero-zeZero);
Lp=abs(yuZero-ydZero);
Lg_=abs(ydZero-ybZero);
Lg=abs(zbZero-zdZero);
h=zuZero-zoZero;
lu=yuZero-yoZero;
H=zaZero-zoZero;
L=yaZero-yoZero;
theta0=-0.1526;

%obliczenie fi

fi=(-1*(zu-zs-H+h+Lg+Lg_+Ld_) - sqrt((zu-zs-H+h+Lg+Lg_+Ld_)^2-4*Lp*(L-Lw*cos(theta0))))/(2*Lp) % Lw*cos(theta0)


yu=sqrt(Lw^2-(zu+h+Lp*fi-Ld)^2)-Lw*cos(theta0)+fi*Ld% + 6
theta = asin((zu+h+Lp*fi-Ld-zs)/Lw)%+theta0


% u  - zu yu
zo=zs; yo=0;
za=zs+H; ya=L;
zu=zu+h; yu=lu+yu;
zd=zu+Lp*sin(fi); yd=yu-Lp*cos(fi);
ze1=zs+Lw*sin(theta); ye1=0+Lw*cos(theta); %-theta0
ze2=zu+Lp*sin(fi)-Ld*cos(fi); ye2=yu-Lp*cos(fi)+Ld_*sin(-fi);

zb=zu+Lp*sin(fi)+Lg*cos(fi); yb=yu-Lp*cos(fi)+Lg_*sin(fi);

cord = [yo, ya, yu, yb, yd, ye1, ye2;...
        zo, za, zu, zb, zd, ze1, ze2;...
        xoZero, xaZero, xuZero, xbZero, xdZero, xeZero, xeZero];
par = [ zs, zu, yu, fi ,theta];

end