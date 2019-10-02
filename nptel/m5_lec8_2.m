clc;
clear all;
close all;
s = tf('s');
Gc = 1/(s*(1+0.1*s)*(1+0.2*s));
% Convertendo para discreto Z
 Gz= c2d(Gc,0.1,'zoh');
 
%Levando para o plano w
%z = (1+0.05*w)/(1-0.05w)

gw = d2c(Gz,'tustin');

%Utilizando K = 30, assim como no problema anterior. E plotando
K=30;
margin(K*gw)

% para freq de 10 rad/sec, fase = 139 = -221
% Para alcancar -180 +45 = -135 é necessário mover 86 graus.

%Reduzindo a especificacao de 45 para 20, 
% 20 - (180-221) = 61 com uma margem de 5,  65
% Que é um valor alcançável.

%Calculando alfa2
alfa2 = (1 - sin(66 * pi/180))/(1+ sin(66 * pi/180))
%Arredondando
alfa2= 0.045;
%Logo, 10 = 1/(thau* sqrt(alfa2))
thau2 = 1/(10 * sqrt(alfa2))
%Arredondando
thau2= 0.47;
%lead Compensador
C2s = K*(thau2*s + 1)/(alfa2*thau2*s + 1)

%Observando o sistema com o lead compensador
margin(gw*C2s)
[Gm,Pm,Wcg,Wcp] = margin(gw*C2s);


%Observando em 10rad/sec GM=-10.8. É preciso atenuar
%-14.2
% para o lag compensator
%1/alfa1 = 14.2
alfa1 = 10 ^(14.2/20);
%Arredondando
alfa1= 5.11

%Posicionando o thau1 bem abaixo da nova frequencia de crossover, 
%faremos utilizando 1
thau1= 1;

%thau1=4;
% Logo o lag compensator
C1s = (1+thau1*s)/(1+alfa1*thau1*s);

%resultado final
margin(gw*C1s*C2s)
%Onde vemos que PM = 20 conforme solicitado
