clc
clear all

zs = [0, 10, 20];
zu = [0, 10, 20];
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
for i=1:length(zs)
    [par, cord] = coordinatesModel(zs(i), zu(i));
    plot(cord(1,:), cord(2,:), 'o');
    hold on
    grid on
end