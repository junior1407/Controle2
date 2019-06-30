clc;
clear all;
A = -3;
B = 1;
C = 1;
D = 0;
%controlador sem ação integradora
K= acker(A, B, -5);

%com controlador
Acc=A-B*K % Cria a matriz A compensada.
Bcc=B; % Cria a matriz B compensada.
Ccc=C; % Cria a matriz C compensada.
Dcc=D; % Cria a matriz D compensada.
ess_i = 1+ Ccc*inv(Acc-Bcc*K)*Bcc 

[numt,dent]=ss2tf (Acc,Bcc,Ccc,Dcc);
Gs = tf(numt, dent)

Aa = [-5 0;1 0];
Ba = [1; 0];
Br = [0; -1];
Ca = [1 0];
Da = 0;
p1 = pole(Gs);
p2 = -5;
polos = [p1, p2];
Ka = acker(Aa,Ba, polos);
Ki = Ka(end);

t = 0:0.1:5;
sys_cl = ss(Aa-Ba*Ki,Br,Ca,Da);
step(sys_cl,t)

ess_f = 1 + Ca*inv(Aa-Ba*Ki)*Ba %erro de regime estacionario