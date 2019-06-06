function dX = samochod(t, X, sym, typ, graw)
% Plik funkcyjny modelu samochodu
% Parametry modelu
ms = 450;
mkp = 36;
mkt = 20;
Js = 600;
L1 = 1.5;
L2 = 1;
e = 0.4;

ko = 2e5;
ksp = 26185;
kst = 19560;
bsp = 2166;
bst = 1880;

% uwzglêdnienie grawitacji
if graw=="tak"
    g=9.81;
else
    g=0;
end

% przypisanie elementów macierzy do zmiennych
xc_dot = X(1); yc_dot = X(2); alfa_dot = X(3); y1_dot = X(4); y2_dot = X(5);
xc = X(6); yc = X(7); alfa = X(8); y1 = X(9); y2 = X(10);

% macierz mas
diagonala = [ ms+mkp+mkt, ms, Js, mkp, mkt, 1, 1, 1, 1, 1 ];
M = diag(diagonala);

% Wybór warunków symualcji

if sym=="przeszkoda"
    yd1 = zeros(size(t));
    yd2 = yd1;
    Qx = 0; Qy = 0; Qalfa = 0; Qy1 = 0; Qy2 = 0;
    if typ=="przod"
        if t>=2 && t<7
            yd2 = 0.05;
        else
            yd2 = 0;
        end
        
    elseif typ=="tyl"
        if t>=2 && t<7
            yd1 = 0.05;
        else
            yd1 = 0;
        end
        
    elseif typ=="oba"
        if t>=2 && t<6
            yd2 = 0.05;
        else
            yd2 = 0;
        end
        if t>=4 && t<8
            yd1 = 0.05;
        else
            yd1 = 0;
        end
    end
    
elseif sym=="hamowanie"
    yd1 = zeros(size(t));
    yd2 = yd1;
    if xc_dot > 0
    T = 4782.8; Mt = T*e;
    else 
    T = 0; Mt = 0;
    end
    Qx = -T; Qy = 0; Qalfa = -Mt; Qy1 = 0; Qy2 = 0;
    
elseif sym=="przyspieszanie"
    yd1 = zeros(size(t));
    yd2 = yd1;
    if xc_dot < 19.44
    Fc = 1640; Mc = Fc*e;
    else 
    Fc = 0; Mc = 0;
    end
    Qx = Fc; Qy = 0; Qalfa = Mc; Qy1 = 0; Qy2 = 0;
end

% Macierz wyrazów wolnych
Wy_wolne = [ Qx;...
    -ms*g + Qy - bsp*(yc_dot + alfa_dot*L2 - y2_dot) - bst*(yc_dot - alfa_dot*L1 - y1_dot) - ksp*(yc + alfa*L2 - y2) - kst*(yc - alfa*L1 - y1);...
    Qalfa - bsp*L2*(yc_dot + alfa_dot*L2 - y2_dot) + bst*L1*(yc_dot - alfa_dot*L1 - y1_dot) - ksp*L2*(yc + alfa*L2 - y2) + kst*L1*(yc - alfa*L1 - y1);...
    -mkp*g + Qy1 + bst*(yc_dot - alfa_dot*L1 - y1_dot) - ko*(y1 - yd1) + kst*(yc - alfa*L1 - y1);...
    -mkt*g + Qy2 + bsp*(yc_dot + alfa_dot*L2 - y2_dot) - ko*(y2 - yd2) + ksp*(yc + alfa*L2 - y2);...
    xc_dot; yc_dot; alfa_dot; y1_dot; y2_dot];


dX = M \ Wy_wolne;
