clc
clear all
close all

zs = [0, 0,]% 0, 0]
zu = [0, 0,]% 50, 100]
0; zoZero = 0; xoZero = 0;
yaZero = 300; zaZero = 600; xaZero = 35; %0
ybZero = 300; zbZero = 150; xbZero = 5; %0
ycZero = 350; zcZero = 125; xcZero = -15; %0
ydZero = 350; zdZero = -25; xdZero = -35; %0
yeZero = 325; zeZero = -50; xeZero = -31; %0
yuZero = 450; zuZero = 50; xuZero = -35; %0
pocz = [0, 300, 300, 350, 350, 325, 450; 0, 600, 150, 125, -25, -50, 50;0, 35, 5, -15, -35, -31, -35];
plot(pocz(1,:), pocz(2,:), 'x');
hold on


% wykres dla mojego modelu
for i=2:length(zs)
    [par, cord] = coordinatesModel3(zs(i), zu(i));
    plot(cord(1,:), cord(2,:), '*');
    hold on
    grid on
    plot(cord(1,[1,6,5,4,2]),cord(2,[1,6,5,4,2]),'k')
    hold on
    plot(cord(1,[3,5]),cord(2,[3,5]),'k')
    hold on
    plot(cord(1,[6,2]),cord(2,[6,2]),'--')
end

% wykres cambera dla obu modeli
zu1=-100:50:100;
zs1=zeros(size(zu1));
param=[]
hold on

%model moj
for i=1:length(zu1)
    [par, cord] = coordinatesModel3(zs1(i), zu1(i));
    param=[param; par];
    
    plot(cord(1,[1,6,5,4,2]),cord(2,[1,6,5,4,2]),'-.r')
    hold on
    plot(cord(1,[3,5]),cord(2,[3,5]),'-.r')
end

% 
% 
% 
% zu1=-100:20:100;
% zs1=zeros(size(zu1));
% param=[]
% 
% %model z artykulu
% 
% figure(3)
% 
% for i=1:length(zu1)
%     [par, cord] = coordinatesModel3(zs1(i), zu1(i));
%     param = [param; par];
% end
% plot(zu1, param(:,4),'r')