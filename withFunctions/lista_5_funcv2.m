clear all; 
clc
w0 = 1;

A = [0 1;-w0^2 1]; %Já está em variaveis de fase.
B = [0;1];
C = [1 0];
D = 0; 

polos= 5*[-2*w0 -2*w0];
[A_new,B_new, C_new, D_new] = designObserver(A,B,C,D,polos)

[numt,dent] = ss2tf(A_new,B_new,C_new,D_new)
T=tf(numt,dent)
SS = tf2ss(numt,dent);

%Informações de desempenho
[wn,z] = tf_wn_zeta(T)
Mp = exp((-z*pi)/(sqrt(1-z^2)))
Ts = 4/(z*wn)
%St = stepinfo(T)