clc
clear all

T=1; % [s] - okres/ czesto podaje sie okres jako 2T
A=1; % amplituda
w=2*pi/T; % omega
N=1001; % liczba elementow wektora czasu

%wektor czasu
t=linspace(-T, T, N);

% generowanie sygna³u prostokatnego dla jednego okres T
piloksztaltny = pilo(t, T);

%szereg fouriera
n=100;
x = zeros(size(t));
for i=1:n
    temp = ((-1).^(i+1))/i *sin(i*pi/T*t);
    x = x + temp;
end
x = x*2*T/pi;

%powielony
kk=5;
piloksztaltny2=repmat(piloksztaltny,1,kk);
t2=linspace(-kk*T,kk*T,kk*N);

x2=zeros(size(t2));
for i=1:n
    temp = ((-1).^(i+1))/i *sin(i*pi/T*t2);
    x2 = x2 + temp;
end
x2 = x2*2*T/pi;


%wykres
figure(1)
plot(t,x,t,piloksztaltny)
figure(2)
plot(t2,x2,t2,piloksztaltny2)

%blad
e2 = abs(piloksztaltny - x)./abs(piloksztaltny);
e2(isnan(e2))=0;
e2(isinf(e2))=0;
e2 = sum(e2)*100/length(t)
