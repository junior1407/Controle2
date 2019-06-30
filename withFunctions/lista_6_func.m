clear all;
clc;
% [dX dXn] = [ ('A'-'B''K') 'B'ke
%             -'C'     0  ]  * [X; Xn]          
% +  ['0' ; 1] *r

% Y = [ 'C' 0] * [X; Xn]
% det(s*I - (novaMatrizA)) = polinomio desejado
%
A = [-10 25; -1 0];
B = [0 ;1];
C = [ 1 0];
D = 0;
%K = [7 -25];
[num,den] = ss2tf(A,B,C,D);
tf(num,den)
err = 1 + C*inv(A)*B
sys_cl = ss(A,B,C,D);
step(sys_cl);