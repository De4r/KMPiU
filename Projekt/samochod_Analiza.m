clc
clear all
close all

% Plik analizy modelu 
% Parametry czasowe
t0=0;
tk=10;
N = 100;
k = 1/N;
t = t0:k:tk-k;

% uwzglêdnienie grawietacji "tak"/ else
graw = "tak";

wyb = input('Jaka symulacja 1-przeszkoda, 2-hamowanie, 3-przyspieszenie: ')

%wybor typu symulacji

if wyb==1
    sym="przeszkoda";
    wyb2 = input('Jaka przeszkoda?  1- sam przod, 2- sam tyl, 3- przód i tyl z przesunieciem w czasie: ')
    if wyb2==1
        typ="przod";
        
    elseif wyb2==2
        typ="tyl";
        
    elseif wyb2==3
        typ="oba";
        
    end
    
    Y0 = zeros(10,1);
       
elseif wyb==2
    sym="hamowanie";
    typ="przod";
    Y0 = zeros(10,1);
    Y0(1) = 70;
    
elseif wyb==3
    sym="przyspieszanie";
    typ="przod";
    Y0 = zeros(10,1);
    
end

% rozwiazanie modelu
[t, y] = ode45(@(t,x) samochod(t, x, sym, typ, graw), t, Y0);

% wyswietlenie wykresów
wykresy(t, y)

% plik zapisu wykresów w wysokiej jakoœci
%wykresy_zapis(t, y, sym, graw)
