clc
clear all

T=1; % [s] - okres/ czesto podaje sie okres jako 2T
A=1; % amplituda
w=2*pi/T; % omega
N=1001; % liczba elementow wektora czasu

%wektor czasu
t=linspace(-T, T, N);

% generowanie sygna³u prostokatnego dla jednego okres T
trojkatny = troj(t, T);

%szereg fouriera
n=2;
x = zeros(size(t));
for i=1:n
    temp = 1/(2*i-1).^2 * cos((2*i-1)*pi/T*t);
    x = x + temp;
end
x = T/2-x*4*T/pi.^2;

%powielony
kk=5;
trojkatny2=repmat(trojkatny,1,kk);
t2=linspace(-kk*T,kk*T,kk*N);

x2=zeros(size(t2));
for i=1:n
    temp = 1/(2*i-1).^2 * cos((2*i-1)*pi/T*t2);
    x2 = x2 + temp;
end
x2 = T/2-x2*4*T/pi.^2;


%wykres
figure(1)
plot(t,x,t,trojkatny)
figure(2)
plot(t2,x2,t2,trojkatny2)

%blad
e2 = abs(trojkatny - x)./abs(trojkatny);
e2(isnan(e2))=0;
e2(isinf(e2))=0;
e2 = sum(e2)*100/length(t)