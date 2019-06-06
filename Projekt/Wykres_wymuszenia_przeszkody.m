clc
clear all

% Skrypt tworz¹cy wykres sygna³u wymuszenia
t0=0;
tk=10;
N = 100;
k = 1/N;
t = t0:k:tk-k;

yd2= zeros(size(t));
for i=1:length(t)
    if t(i)>=2 && t(i)<7
            yd2(i) = 0.05;
    end
end

figure('units','normalized','outerposition',[0 0 1 1])
plot(t, yd2, 'LineWidth', 2.5)

title({'$Przebieg\ wymuszenia\ od\ przeszkody$'},'Interpreter','latex')
xlabel({'$Czas\ [s]$'},'Interpreter','latex')
ylabel({'$Amplituda\ [m]$'},'Interpreter','latex')
grid on
set(gca,'fontsize',22)
print(gcf,'Wymuszenie_geometryczne','-dpng','-r300')