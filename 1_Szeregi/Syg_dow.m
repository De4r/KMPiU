clc
clear all

T=pi; % [s] - okres/ czesto podaje sie okres jako 2T
A=1; % amplituda
w=2*pi/T; % omega
N=1001; % liczba elementow wektora czasu

%wektor czasu
t=linspace(-T, T, N);

% generowanie sygna³u prostokatnego dla jednego okres T
syg = t.^2-3*t;

%szereg fouriera
n=500;
x = zeros(size(t));
for i=1:n
    temp = 4*(-1).^i/i*cos(i*t)+6*(-1).^i/i*sin(i*t);
    x = x + temp;
end
x = pi.^2/3+x;

%powielony
kk=5;
syg2=repmat(syg,1,kk);
t2=linspace(-kk*T,kk*T,kk*N);

x2=zeros(size(t2));
for i=1:n
    temp = 4*(-1).^i/i*cos(i*t2)+6*(-1).^i/i*sin(i*t2);
    x2 = x2 + temp;
end
x2 = pi.^2/3+x2;


%wykres
figure(1)
plot(t,x,t,syg)
figure(2)
plot(t2,x2,t2,syg2)

%blad
e2 = abs(syg - x)./abs(syg);
e2(isnan(e2))=0;
e2(isinf(e2))=0;
e2 = sum(e2)*100/length(t)
