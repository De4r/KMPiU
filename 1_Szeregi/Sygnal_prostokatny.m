clc
clear all

T=2; % [s] - okres/ czesto podaje sie okres jako 2T
A=1; % amplituda
w=2*pi/T; % omega
N=1001; % liczba elementow wektora czasu

%wektor czasu
t=linspace(0, T, N);

% generowanie sygna³u prostokatnego dla jednego okres T
prostokatny = rectan(t, A, T);

%szereg fouriera
n=100;
x = zeros(size(t));
for i=1:2:2*n
    temp = 1/i * sin(i*w*t);
    x = x + temp;
end
x = x*4*A/pi;

%powielony
kk=5;
prostokatny2=repmat(prostokatny,1,kk);
t2=linspace(0,kk*T,kk*N);

x2=zeros(size(t2));
for i=1:2:2*n
    temp = 1/i * sin(i*w*t2);
    x2 = x2 + temp;
end
x2 = x2*4*A/pi;


%wykres
figure(1)
plot(t,x,t,prostokatny)
figure(2)
plot(t2,x2,t2,prostokatny2)

%blad
e2 = abs(prostokatny - x)./abs(prostokatny);
e2(isnan(e2))=0;
e2(isinf(e2))=0;
e2 = sum(e2)*100/length(t)
