% % ejemplo
% Señal de tiempo continuo
% t=0:0.001:1;
% xt=2*cos(2*pi*2*t)+3*sin(2*pi*6*t);
% figure,
% plot(t,xt)
% hold on
% % Discretización de la señal análoga
% Ts=1/18; %Periodo de muestreo
% Fs=1/Ts;
% nT=0:Ts:1;
% xnT=2*cos(2*pi*2*nT)+3*sin(2*pi*6*nT);
% stem(nT,xnT)
% hold off
% N=Fs;
% % Señal de tiempo discreto
% n=0:N;
% xn=2*cos(2*pi*(2/Fs)*n)+3*sin(2*pi*(6/Fs)*n);
% figure,
% stem(n,xn)

clear all,clc
%Funcion
y=inline('3*cos(2*pi*15*x)+4*sin(2*pi*25*x)-3*sin(2*pi*20*x)');
%Periodo
p=0.2;
% numero de ciclos
c=2;
% f=gcd([15 25 20]) %minimo comun divisor
t=0:0.001:p*c;
xt=y(t);

% Graficar
figure('IntegerHandle','off','Name','Muestreo de señales y aliasing')
%grafica tiempo continuo
plot(t,xt)

title('3*cos(2*pi*15*x)+4*sin(2*pi*25*x)-3*sin(2*pi*20*x)')
ylabel('Valor')


hold on
% Discretización de la señal análoga
M=25;%Numero de muestras
S=1; %Tiempo para muestrear
Ts=1/((p*c*M)/S) %Periodo de muestreo(muestras en un segundo)
Fs=1/Ts;
nT=0:Ts:p*c;
xnT=y(nT);
stem(nT,xnT)
legend('Continuo','Discreto')
N=Fs;
% Señal de tiempo discreto
n=0:N;
xn=y(n/Fs);

% %Graficas de No.muestra y tiempo en uno
% a1Pos = get(gca,'Position');
% 
% %// Place axis 2 below the 1st.
% ax2 = axes('Position',[a1Pos(1) a1Pos(2)-.05 a1Pos(3) a1Pos(4)],'Color','none','YTick',[],'YTickLabel',[]);
% 
% %// Adjust limits
% xlim([min(n(:)) max(n(:))])
% 
% text(max(n(:)),0 ,'Muestra','FontSize',8,'Color','r')
% text(max(n(:)),.05 ,'Segundos [s]','FontSize',8,'Color','r')

figure('IntegerHandle','off','Name','Muestreo de señales y aliasing')
stem(n,xn)
title('Señal Discreta M=25')
ylabel('Valor')
xlabel('Muestra')
