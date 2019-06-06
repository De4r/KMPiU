function wykresy_zapis(t, y, typ, graw)

% Plik tworzenia wykresów wyników symulacji w wysokiej rozdzielczosci
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
    figure('units','normalized','outerposition',[0 0 1 1])
    
    plot(t,y(:,i), 'LineWidth', 2.5)
    xlabel({xopis},'Interpreter','latex')
    grid on
    if i==3
        ylabel({yopis(1)},'Interpreter','latex')
    else
        ylabel({yopis(2)},'Interpreter','latex')
    end
    title({tytuly(2*i-1)},'Interpreter','latex')
    set(gca,'fontsize',22)
    print(gcf,["wykres_"+num2str(2*i-1)+"_"+typ+"_"+graw],'-dpng','-r300')


    figure('units','normalized','outerposition',[0 0 1 1])
    plot(t,y(:,i+5), 'LineWidth', 2.5)
    xlabel({xopis},'Interpreter','latex')
    grid on
    if i==3
        ylabel({yopis(3)},'Interpreter','latex')
    else
        ylabel({yopis(4)},'Interpreter','latex')
    end
    title({tytuly(2*i)},'Interpreter','latex')
    set(gca,'fontsize',22)
    print(gcf,["wykres_"+num2str(2*i)+"_"+typ+"_"+graw],'-dpng','-r300')
end

Fkolumny = zeros(size(t));
Fkolumny = ksp * (y(:,7)+y(:,8)*L2-y(:,10)) + bsp*(y(:,2)+y(:,3)*L2-y(:,5));



figure('units','normalized','outerposition',[0 0 1 1])
plot(t, Fkolumny,  'LineWidth', 2.5)

title({'$Sila\ przenoszona\ przez\ kolumne$'},'Interpreter','latex')
xlabel({xopis},'Interpreter','latex')
ylabel({'$Amplituda\ [N]$'},'Interpreter','latex')
grid on
set(gca,'fontsize',22)
print(gcf,["sily_kolumna_"+typ+"_"+graw],'-dpng','-r300')

Fkolumny2 = zeros(size(t));
Fkolumny2 = kst * (y(:,7)-y(:,8)*L1-y(:,9)) + bst*(y(:,2)-y(:,3)*L1-y(:,4));




figure('units','normalized','outerposition',[0 0 1 1])
plot(t, Fkolumny2, 'LineWidth', 2.5)

title({'$Sila\ przenoszona\ przez\ tylne\ zawiszenie$'},'Interpreter','latex')
xlabel({xopis},'Interpreter','latex')
ylabel({'$Amplituda\ [N]$'},'Interpreter','latex')
grid on
set(gca,'fontsize',22)
print(gcf,["sily_tylne_zaw_"+typ+"_"+graw],'-dpng','-r300')
end