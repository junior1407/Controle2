clear all; clc

numg = 1;
deng = [1 3];
[Ac,Bc,Cc,Dc] = tf2ss(numg,deng)

P=[1];
% Transforma Ac para a forma de variáveis de fase.
Ap=inv(P)*Ac*P;
% Transforma Bc para a forma de variáveis de fase.
Bp=inv(P)*Bc;
% Transforma Cc para a forma de variáveis de fase.
Cp=Cc*P;
% Transforma Dc para a forma de variáveis de fase.
Dp=Dc;

%controlador sem ação integradora
K= acker(Ap, Bp, -5)

%com controlador
Acc=Ap-Bp*K % Cria a matriz A compensada.
Bcc=Bp; % Cria a matriz B compensada.
Ccc=Cp; % Cria a matriz C compensada.
Dcc=Dp; % Cria a matriz D compensada.

ess = 1 + Cp*inv(Ap - Bp*K)*Bp

[numt,dent]=ss2tf(Acc,Bcc,Ccc,Dcc);
Gs = tf(numt, dent)

r = roots(dent)
polos=[r -5]
eq_caracteristica_desejada=poly(polos)

%Obtendo ganhos com ação integradora
Ke = eq_caracteristica_desejada(end)
k1 = eq_caracteristica_desejada(end-1)-deng(end)

Ai = [Ap-Bp*k1 Bp*Ke; -Cp 0]
Bi = [0;1]
Ci = [Cp 0]

Tff = tf(Ke,eq_caracteristica_desejada)
Tf = tf(ss(Ai,Bi,Ci,Dp))

ess = 1 + Ci*inv(Ai)*Bi

step(Tff)
