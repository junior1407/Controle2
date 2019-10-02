clc; clear all; close all

%Intervalo de amostragem
T = 0.1

s = tf('s');
Gc = 1/((s+1)*(0.5*s+1));
% passando para Z
Gz = c2d(Gc,0.1,'zoh');

%levando para w
gw = d2c(Gz,'tustin');

%Precisamos projetar um compensador de atraso de fase para que o PM do 
%sistema compensado seja pelo menos 50° e o erro de estado estacionário para
%uma entrada de degrau unitário seja ? 0,1. %Dado Gw(0) = 1, ka = 9, para
%erro de 0.1.

ka = 9
figure(1)
bode(ka*gw)

%Introduzindo k no sistema original, temos:
syms k
syms w
Mag = 0.00025*k*sqrt(400 + w^2)*sqrt(160000 + w^2)/(sqrt(1+w^2) * sqrt(4+w^2))
phase = -atan(w) - atan(0.5*w) - atan(0.05*w) - atan(0.0025*w)

%O PM necessário é de 50°, porém vamos colocar uma margem de segurança de
%5°. Assim, o PM do sistema modificado com k deve ser de 55°. A partir
%disto, obtemos: 

wg = 2.44

%Para ter wg = 2.44 rad/s, a frequência do gain crossover deve ser unitária,
%demos que temos:

k = (sqrt(1+wg^2)*sqrt(4+wg^2)) / ( sqrt(400 + wg^2)*sqrt(160000 + wg^2)*0.00025 )

alpha = ka/k

%Em seguida, determinamos tau:
tau = 10/wg

%Compensador
Cs = ka*tf([tau 1],[alpha*tau(1) 1])

%Fazendo a substituição s = 20*(z-1)/(z+1), temos:
syms z
Cz = 9*(83*z - 81)/(179*z - 177)




