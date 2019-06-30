clear all; clc

%Antes de Adicionar Integrador
numg = 1;
deng = [1 3];
[A,B,C,D] = tf2ss(numg,deng);
[A_new,B_new,C_new,D_new] = designController(A,B,C,D,[-5 -5]);

ess = 1 + C_new*inv(A_new)*B_new
