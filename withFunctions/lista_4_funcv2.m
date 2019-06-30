clear all; 
clc;
close all;
w0 = 1;

A = [0 1;-w0^2 1]; %Já está em variaveis de fase.
B = [0;1];
C = [1 0];
D = 0; 

[num,den] = ss2tf(A,B,C,D);
[Ac, Bc,Cc,Dc] = tf2ss(num,den);
Tf = tf(num,den);

% Especifica a posição de todos os polos.
polos=[-2*w0 -2*w0];
[Apnew,Bpnew,Cpnew,Dpnew] = designController(A,B,C,D,polos);

% Cria o numerador e o denominador de T(s).
[numt,dent]=ss2tf(Apnew,Bpnew,Cpnew,Dpnew);

% Cria e exibe T(s).
T=tf(numt,dent);

% Cria e exibe Tee, um objeto espaço de estados LTI.
SS=ss(Apnew,Bpnew,Cpnew,Dpnew);

% Produz a resposta ao degrau compensada.
x0 = [1;0];
subplot(2,1,1)
initial (SS,x0) 

subplot(2,1,2)
impulse(SS)

%Informações de desempenho
[wn,z] = tf_wn_zeta(T);
Mp = exp((-z*pi)/(sqrt(1-z^2)));
Ts = 4/(z*wn);
St = stepinfo(T)