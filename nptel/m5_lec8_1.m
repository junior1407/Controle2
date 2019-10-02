clc;
clear all;
close all;
s = tf('s');
Gs = 1/(s*(1+0.1*s)*(1+0.2*s));
% Para  Kv = 30
% s-> implica em C(s) -> K
% Kv = lim s->0 s * G(s) * C(s) = K
% logo K = 30
K=30;
[Gm,Pm,Wcg,Wcp] = margin(K*Gs);
% PM = -17.2 e Wcp = 9.77  Como PM < 0, é preciso um lead-compensator.
%Como queremos uma frequencia de crossover de 10rad/sec
margin(K*Gs)
%Observamos que a fase em 10 rad/sec é -198
% Portanto, adequando nas especificacoes
% 45 - (180-198) = 63. Onde aumentaremos 2 graus como margem de segurança
%=  65
%Calculando alfa2
alfa2 = (1 - sin(65 * pi/180))/(1+ sin(65 * pi/180))
%Arredondando
alfa2= 0.05;
%Logo, 10 = 1/(thau* sqrt(alfa2))
thau2 = 1/(10 * sqrt(alfa2))
%Arredondando
thau2= 0.45;
%lead Compensador
C2s = K*(thau2*s + 1)/(alfa2*thau2*s + 1)

%Observando o sistema com o lead compensador
margin(Gs*C2s)
[Gm,Pm,Wcg,Wcp] = margin(C2s*Gs);

%Observando em 10rad/sec a fase é -134 e o ganho é 12dB. É preciso atenuar
%-12.6
% para o lag compensator
%1/alfa1 =  12.6
alfa1 = 10 ^(12.6/20);
%Arredondando
alfa1= 4.27;
thau1= 1/alfa1;
%Arredondando
thau1=4;
% Logo o lag compensator
C1s = (1+thau1*s)/(1+alfa1*thau1*s);

%resultado final
margin(Gs*C1s*C2s)
%Onde vemos que PM = 45.3 conforme solicitado