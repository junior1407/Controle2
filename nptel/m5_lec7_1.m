clc; 
clear all; close all


%Dado o sistema:
s = tf('s');
Gs = 1/((s+1)*(0.5*s+1));

%O ess para um degrau unitário é dado
%lim s-> 0 
%1/(1 + C(0)) = 1/(1 + ka) 
%Como ele deve ser inferior ou igual a 0.1, temos:
%1/(1 + ka) <= 0.1 -> ka >= 9

ka = 9; %ka = k*alpha
bode(ka*Gs)

%Introduzindo k no sistema original:
syms k
syms w

Mag = k/(sqrt(1+w^2)*sqrt(1+0.25*w^2))
phase = -atan(w) - atan(0.5*w)

% O PM do circuito em malha fechada deve ser 50°. 
%Como PM é obtido apenas selecionando K, ele pode ser desviado deste valor 
%quando os outros parâmetros também são projetados. Assim, colocamos uma 
%margem de segurança de 5° para o PM. A partir disso, temos:

wg = roots([0.715 -1.5 -1.43])

%Para ter wg = 2.8 rad/s, a frequência do gain crossover deve ser unitária,
%demos que temos:

k = sqrt(1+wg(1)^2)*sqrt(1+0.25*wg(1)^2)
alpha = ka/k

%Em seguida, determinamos tau:
tau = 10/wg

%Compensador
Cs = ka*tf([tau(1) 1],[alpha*tau(1) 1])

margin(Cs*Gs)