clc;
clear all;
D=1.395e4;
E=111.6;
F=16.74;

% Teste para ver se é acima ou abaixo da curva a região de estabilidade
Kzin = 0.04;
Tzin = 0.2;

%Elemento da coluna que deve ser > 0 
B =  (16*E*F*Tzin-16*E^2*Tzin^2 -16*D*Kzin*Tzin - 8*D*F*Kzin*Tzin^2 + 24*D*E*Kzin*Tzin^3 - 8*D^2*Kzin^2*Tzin^4)/(4*E - 4*D*Kzin*Tzin);

%Se positivo, é acima da curva.
B

%Isolando T, se obtem:
%T = (sqrt((E*F/2-D*K)^2/(D^4*K^4)+((D*F*K-E^2)/3)^3/(D^6*K^6))+(E*F/2-D*K)/(D^2*K^2))^(1/3)+(-sqrt((E*F/2-D*K)^2/(D^4*K^4)+((D*F*K-E^2)/3)^3/(D^6*K^6))+(E*F/2-D*K)/(D^2*K^2))^(1/3)+E/(D*K);

%Valores de K seguindo especificações começando de 0.
subplot(2,1,1)
K  = 0.0:0.001:0.0670;
T = (sqrt((E*F/2-D*K).^2/(D.^4*K.^4)+((D*F*K-E.^2)/3).^3/(D.^6*K.^6))+(E*F/2-D*K)/(D.^2*K.^2)).^(1/3)+(-sqrt((E*F/2-D*K).^2/(D.^4*K.^4)+((D*F*K-E.^2)/3).^3/(D.^6*K.^6))+(E*F/2-D*K)/(D.^2*K.^2)).^(1/3)+E./(D*K);
plot(K,T)
title("Comecando de 0")
xlabel("K")
ylabel("T")

subplot(2,1,2)
K  = 0.01:0.001:0.0670;
T = (sqrt((E*F/2-D*K).^2/(D.^4*K.^4)+((D*F*K-E.^2)/3).^3/(D.^6*K.^6))+(E*F/2-D*K)/(D.^2*K.^2)).^(1/3)+(-sqrt((E*F/2-D*K).^2/(D.^4*K.^4)+((D*F*K-E.^2)/3).^3/(D.^6*K.^6))+(E*F/2-D*K)/(D.^2*K.^2)).^(1/3)+E./(D*K);
plot(K,T)
title("Comecando de 0.01")
xlabel("K")
ylabel("T")