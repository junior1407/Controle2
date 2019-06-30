clear all; clc

%Antes de Adicionar Integrador
numg = 1;
deng = [1 3];
%numg= [0 0 1];
%deng = [1 5 3];
[A,B,C,D] = tf2ss(numg,deng);

%Adicionando integrador
integral = tf(1,[1 0])
T = tf(numg,deng) * integral
[num,den] = tfdata(T,'v')

% SS com integrador
[A_1,B_1,C_1,D_1] = tf2ss(num,den)

% K_KE contem todos K e o Ke no fim
K_Ke = acker(A_1,B_1,[-5 -5])
%K_Ke = acker(A_1,B_1,roots([1 116 1783.1 18.31])')

K= K_Ke(1:end-1) %Separei só os K
Ke= K_Ke(end) % Separei só o Ke

A_new = [ A-B*K B*Ke; -C 0]
B_new = [zeros(size(B,1),1);1];
C_new = [C 0];
D_new = D;

ess = 1 + C_new*inv(A_new)*B_new
