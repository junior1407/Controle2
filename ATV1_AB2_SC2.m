clear;
close all;
clc;

%% 
syms r k t
%syms D E F
D=1.395e-4;
E=111.6;
F=16.74;

a2 = E*t^2 + F*t -3;
a1 = 3 - 2*F*t + D*k*t^3;
a0 = D*k*t^3 + F*t - E*t^2 -1;

A3 = a2+a1+a0+1;
A2 = a2-a1-3*a0+3;
A1 = -a2-a1+3*a0+3;
A0 = -a2+a1-a0+1;

m1 = [A3 A1; A2 A0];

B = -det(m1)/A2;

m2 = [A2 A0; B 0];

C = -det(m2)/B;

% Da tabela de Hourth, T< 2/F para que o sistema seja estável
K   = solve(B,k);
% Há duas solucoes
K_1= []; % EIxo Y_1
K_2= []; % Eixeo Y_2  %K_2 é negativo para qualquer T

T_ = 0.001:0.0001:(2/F); % eixo x
T_ = T_(1:end-1); %Removendo ultimo elemento

%K_2 é desprezado pois é sempre negativo.
for i = 1:length(T_)
    K_1 = [ K_1 double(subs(K(1),t,T_(i)))];
  %  K_2 = [ K_2 double(subs(K(2),t,T_(i)))];
end
plot(T_,K_1)    
hold on
title("")
xlabel("T")
ylabel("K")
hold on

% K > 0
reta = zeros(1,length(T_));
%reta = E./(D*T_);
plot(T_,reta)

%Código para pintar área entre.
x2 = [T_, fliplr(T_)];
inBetween = [K_1, fliplr(reta)];
fill(x2, inBetween, 'g');

%Código para testar um par (t,k) 

double(subs(B, [t k], [ 0.11 0.1]))
double(subs(E*t^2 - D*k*t^3, [t k], [ 0.11 0.1]))
plot(0.11,0.1,'r*')