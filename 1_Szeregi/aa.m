clc
clear
N=20; %Liczba harmonicznych
k=1:N;
A=0.5; %Amplituda
Of = 0.5; %Offset
T=0.1; %Okres
w=2*pi/T;
t=0:T/N/10:2*T;
ck = A*j*(1-cos(k*pi))./(-1*pi*k); %Wspolczynniki Fouriera
ak = 2*real(ck);
bk = -2*imag(ck);
a0 = Of;
widmo_A = abs (ck) ; %Widmo amplitudowe
widmo_F = angle (ck) ; %Widmo fazowe
x = a0;
for k=1:N,
 x = x + (bk(k).*sin(k*w*t)); %Przebieg sygnalu w dziedzinie czasu
end
%Przebiegi czasowe
subplot(3,1,1)
plot(t,x); grid on ; hold on
title('Przebieg czasowy sygnalu prostokatnego')

%Widma
k=1:N;
subplot(3,1,2)
stem (k,widmo_A)
title('Widmo amplitudowe')
subplot(3,1,3)
stem (k,widmo_F)
title('widmo fazowe')