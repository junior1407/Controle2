clc;
clear all;
close all;
s = tf('s');
Gs = 1/(10*s + 1);
Ts = 0.001;
Gz = c2d(Gs,Ts);

%Observando o formato do polin�mio:
d = 1;
n_a = 1; %aproximadamente
n_b = 0; %aproximadamente
n_r = n_b+d -1;
n_s = n_a -1; 


p1 = exp(-1/10); %Do polin�mio antes da transformada z.

%Adequando no formato desejado,  P = A*R + Z_1 * B* S
% Separando a equa��o em parcelas contendo Z_1 e n�o contendo.
Rz = 1;
%-0.9048 = 0.00952 * So  - 0.905 * Ro, 
Sz = 0;

%Para obter To,  To = P(1)/B(1)
Tz = (1 -p1)/0.095;

FT = Tz*feedback((1/Rz)*Gz, Sz);

t = 0:0.001:49 * 0.001;
reff = t.*2;

%ref = [ones(1,10)*0 ones(1,10)*1 ones(1,10)*3 ones(1,10)*2 ones(1,10)*4 ]

lsim(FT,reff,t) 
    