clear all; 
clc
w0 = 1;

A = [0 1;-w0^2 1]; %J� est� em variaveis de fase.
B = [0;1];
C = [1 0];
D = 0; 

[num,den] = ss2tf(A,B,C,D);
[Ac, Bc,Cc,Dc] = tf2ss(num,den);
[Ao,Bo,Co,Do] = ss2obsercanon(A,B,C,D)
Tf = tf(num,den);

polos= 5*[-2*w0 -2*w0]
L = acker(Ao',Co',polos)';
[numt,dent] = ss2tf(Ao-L*Co,Bo,Co,Do)
T=tf(numt,dent)
SS = tf2ss(numt,dent);

%Informa��es de desempenho
[wn,z] = tf_wn_zeta(T)
Mp = exp((-z*pi)/(sqrt(1-z^2)))
Ts = 4/(z*wn)
%St = stepinfo(T)