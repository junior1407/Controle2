clear all; 
clc
w0 = 1;

A = [0 1;-w0^2 1]; %Já está em variaveis de fase.
B = [0;1];
C = [1 0];
D = 0; 

[num,den] = ss2tf(A,B,C,D);
[Ac, Bc,Cc,Dc] = tf2ss(num,den);
Ao=Ac';                             
Bo=Cc';                            
Co=Bc';                             
Do=Dc;
Tf = tf(num,den)

polos= 5*[-2*w0 -2*w0]
L = acker(Ao',Co',polos)';
% Cria e exibe T(s).
[numt,dent] = ss2tf(Ao-L*Co,Bo,Co,Do)
T=tf(numt,dent)
SS = tf2ss(numt,dent);

% Produz a resposta ao degrau compensada.
%x0 = [1;0];
%subplot(2,1,1)
%initial (Tee,x0,0:0.1:1) %iMPULSO
%initial (Tee,x0) 

%subplot(2,1,2)
%impulse(Tee)

%Informações de desempenho
[wn,z] = damp(T)
Mp = exp((-z(1)*pi)/(sqrt(1-z(1)^2)))
Ts = 4/(z(1)*wn(1))
%St = stepinfo(T)