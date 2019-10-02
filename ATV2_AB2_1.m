clear;
close all;
clc;
syms z k
%syms D E F
D=1.395e-4;
E=111.6;
F=16.74;
t=0.1;
a3 = 1;
a2 = E*t^2 + F*t -3;
a1 = 3 - 2*F*t + D*k*t^3;
a0 = D*k*t^3 + F*t - E*t^2 -1;
b0 = det([a0 a3;a3 a0]);
b1 = det([a0 a2;a3 a1]);
b2 = det([a0 a1;a3 a2]);

P= z^3*a3 + z^2*a2 + z*a1 + a0;
P_1 = subs(P,z,1);
%Condicao 1
%P(1) > 0
% Basta que K>0

%Condicao 2
%(-1)^n * P(-1) >0
%P(-1) < 0
P_minus1 = subs(P,z,-1);
%Verdeiro para todos os casos.

%Condicao 3
% abs(a0) < a3
% abs(a0) - a3 < 0
cond3 = sqrt(a0^2) - a3;
% É uma reta descrescente em módulo sutraida por um, sua parte negativa é rebatida pra
% cima depois subtraida em uma unidade

%Vai parecer um formato de V.
sol_1 = solve(cond3==0, k);
% K deve estar entre sol_1(1) < k <  sol_1(2)
% Como sol_1(1) é negativo, e sabemos que k> 0
% 0 < K < sol_1(2)
% onde sol_1(2) = (10*E - 100*F + 2000)/D = 1.0337e+7

%Condicao 4
% |b0| > |b2|
% |b0| - |b2| > 0

cond4 = sqrt(b0^2) -sqrt(b2^2);
sol_2 = double(solve(cond4 ==0, k));
Y_1 = [];
% Há 4 solucoes, desprezando as solucoes 1 e 3 que são negativas,
% K < sol_2(4)
% K > sol_2(2)

%Até agora possuimos

% K < sol_2(4)
% K > sol_2(2)
% K < sol_1(2)
% K > 0

% Fazendo a intersecao de todas, resta

% 0 < K < sol_2(4)  É o intervalo pedido!
%sol_2(4) = 6.9164e+06 Ganho máximo
% No exercicio 1, double(subs(K(1),t,0.1)) resultado no mesmo ganho
% Logo, os ganhos máximos são iguais em ambos exercícios.


% Plot comparativo de Intervalos

interval = 0:20000:sol_1(2);
for i=interval
   Y_1 = [Y_1 double(subs(cond4,k,i))]; 
end

figure(1)
% Fazendo a comparação 
plot (interval, Y_1)
title("Comparativo de Intervalos na condição 4")
hold on
SP=sol_2(2);
line([SP SP],[min(Y_1) max(Y_1)],'Color',"black")
hold on 
SP=sol_2(4); 
line([SP SP],[min(Y_1) max(Y_1)],'Color',"blue")
SP=sol_1(2); 
line([SP SP],[min(Y_1) max(Y_1)],'Color',"green")
SP=0; 
line([SP SP],[min(Y_1) max(Y_1)],'Color',"yellow")

figure(2)
interval = 0:20000:sol_2(4);
Y_2 = [];
for i=interval
   Y_2 = [Y_2 double(subs(cond4,k,i))]; 
end

plot(interval, Y_2)
title("K possiveis para T=0.1")
