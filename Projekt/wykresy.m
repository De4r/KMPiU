function wykresy(t, y)

% Wyswietlenie wyników symulacji

ms = 450;
mkp = 36;
mkt = 20;
Js = 600;
L1 = 1.5;
L2 = 0.5;
e = 0.4;

ko = 2e5;
ksp = 26185;
kst = 19560;
bsp = 2166;
bst = 1880;

xopis = ['$Czas\ [s]$'];
yopis = {['$Predkosc\ katowa\ \frac{rad}{s}$'], ['$Predkosc\ \frac{m}{s}$'], ['$Przem.\ katowe\ [rad]$'], ['$Przem.\ [m]$']};
tytuly = {['$Predkosc\ dla\ x$'], ['$Przemieszczenie\ dla\ x$'], ['$Predkosc\ dla\ y$'], ['$Przemieszczenie\ dla\ y$'], ...
    ['$Predkosc\ katowa\ dla\ \alpha$'], ['$Przem.\ katowe\ dla\ \alpha$'], ['$Predkosc\ dla\ y_1$'], ['$Przemieszczenie\ dla\ y_1$'],...
    ['$Predkosc\ dla\ y_2$'], ['$Przemieszczenie\ dla\ y_2$']};
yopis = string(yopis);
tytuly = string(tytuly);

for i=1:5
    figure(i)
    subplot(211)
    plot(t,y(:,i))
    xlabel({xopis},'Interpreter','latex')
    grid on
    if i==3
        ylabel({yopis(1)},'Interpreter','latex')
    else
        ylabel({yopis(2)},'Interpreter','latex')
    end
    title({tytuly(2*i-1)},'Interpreter','latex')
    
    subplot(212)
    plot(t,y(:,i+5))
    xlabel({xopis},'Interpreter','latex')
    grid on
    if i==3
        ylabel({yopis(3)},'Interpreter','latex')
    else
        ylabel({yopis(4)},'Interpreter','latex')
    end
    title({tytuly(2*i)},'Interpreter','latex')
end

Fkolumny = zeros(size(t));
Fkolumny = ksp * (y(:,7)+y(:,8)*L2-y(:,10)) + bsp*(y(:,2)+y(:,3)*L2-y(:,5));

figure(6)
plot(t, Fkolumny)

title({'$Sila\ przenoszona\ przez\ kolumne$'},'Interpreter','latex')
xlabel({xopis},'Interpreter','latex')
ylabel({'$Amplituda\ [N]$'},'Interpreter','latex')
grid on


Fkolumny2 = zeros(size(t));
Fkolumny2 = kst * (y(:,7)-y(:,8)*L1-y(:,9)) + bst*(y(:,2)-y(:,3)*L1-y(:,4));

figure(7)
plot(t, Fkolumny2)

title({'$Sila\ przenoszona\ przez\ tylne\ zawiszenie$'},'Interpreter','latex')
xlabel({xopis},'Interpreter','latex')
ylabel({'$Amplituda\ [N]$'},'Interpreter','latex')
grid on

end