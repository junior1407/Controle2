clc;
clear all;
close all;
s = tf('s');
Gs = 1/(10*s + 1);
Ts = 1;
Gz = c2d(Gs,Ts);

%Observando o formato do polinômio:
d = 1;
n_a = 1; %aproximadamente
n_b = 0; %aproximadamente
n_r = n_b+d -1;
n_s = n_a -1; 


p1 = exp(-1/10); %Do polinômio antes da transformada z.

%Adequando no formato desejado,  P = A*R + Z_1 * B* S
% Separando a equação em parcelas contendo Z_1 e não contendo.
Rz = 1;
%-0.9048 = 0.00952 * So  - 0.905 * Ro, 
Sz = 0;

%Para obter To,  To = P(1)/B(1)
Tz = (1 -p1)/0.095;

FT = Tz*feedback((1/Rz)*Gz, Sz);


ref = [ones(1,200)*0 ones(1,200)*1 ones(1,200)*3 ones(1,200)*2 ones(1,200)*4 ];
t = 0:Ts:(size(ref,2)-1)*Ts;
lsim(FT,ref,t)
title("Simulação com Ts=1, e N = 1000")
    