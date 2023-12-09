clear all 
clc
% Señal de tiempo continuo 
t=0:0.001:1;
xt=12*cos(2*pi*2*t)+3*sin(2*pi*6*t);
figure,
plot(t,xt)
hold on
% Discretización de la señal análoga 
Ts=1/18;%Periodo de muestreo
Fs=1/Ts; nT=0:Ts:1;
xnT=12*cos(2*pi*2*nT)+3*sin(2*pi*6*nT);
stem(nT,xnT)
hold off
N=Fs;
% Señal de tiempo discreto 
n=0:N;
xn=12*cos(2*pi*(2/Fs)*n)+3*sin(2*pi*(6/Fs)*n);
 
figure,
stem(n,xn)

%Cuantificacion de señales
% Generando señal análoga
t=0:0.001:1;
xt=12*cos(2*pi*3*t)+3*cos(2*pi*6*t);
%Discretizando señal en tiempo
Ts=1/18;
Fs=1/Ts;
nTs=0:Ts:1;
xnTs=12*cos(2*pi*3*nTs)+3*cos(2*pi*6*nTs);
%Mostrando en pantalla
figure('Name','Señal analoga y señal discretizada')
plot(t,xt);
hold on
stem(nTs,xnTs);
hold off
%cuantificando la señal de tiempo discreto
ran=max(xt)-min(xt);%rango de la señal
nbits=4;%bits de cuantificacion
nnivs=(2^nbits)-1;%numero de niveles de cuantificacion
delta=ran/nnivs;%altura de nivel
nive=min(xt):delta:max(xt);
nivem=nive+delta/2;
[~,N]=size(nTs);
xnq=zeros(1,N);
for i=1:N
j=1;
while xnTs(i)>nivem(j)
j=j+1;
end
xnq(i)=nive(j);
end
figure('Name','Señal discretizada y señal cuantificada')
stem(nTs,xnq)
hold on
stem(nTs,xnTs)
hold off
%error de cuantificacion
err=xnTs-xnq;
figure('Name','Error de cuantificacion')
stem(nTs,err);
meadia_err=mean(err)
desv_err=std(err)