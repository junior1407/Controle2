
clc;
clear all;

D=1.395e4;
E=111.6;
F=16.74;
Kzin = 0.03;
Tzin = 0.7;

%Elemento da coluna que deve ser > 0 
B =  (16*E*F*Tzin-16*E^2*Tzin^2 -16*D*Kzin*Tzin - 8*D*F*Kzin*Tzin^2 + 24*D*E*Kzin*Tzin^3 - 8*D^2*Kzin^2*Tzin^4)/(4*E - 4*D*Kzin*Tzin)

%Isolando T, se obtem:
%T = (sqrt((E*F/2-D*K)^2/(D^4*K^4)+((D*F*K-E^2)/3)^3/(D^6*K^6))+(E*F/2-D*K)/(D^2*K^2))^(1/3)+(-sqrt((E*F/2-D*K)^2/(D^4*K^4)+((D*F*K-E^2)/3)^3/(D^6*K^6))+(E*F/2-D*K)/(D^2*K^2))^(1/3)+E/(D*K);

%T = root(sqrt((EF/2-DK)^2/(D^4K^4)+((DFK-E^2)/3)^3/(D^6K^6))+(EF/2-DK)/(D^2K^2), 3)+root(-sqrt((EF/2-DK)^2/(D^4K^4)+((DFK-E^2)/3)^3/(D^6K^6))+(EF/2-DK)/(D^2K^2), 3)+E/(DK)
K  = 0.0:0.001:0.0670;
%Teste = (sqrt((E*F/2-D*kzin).^2/(D.^4*kzin.^4)+((D*F*kzin-E.^2)/3).^3/(D.^6*kzin.^6))+(E*F/2-D*kzin)/(D.^2*kzin.^2)).^(1/3)+(-sqrt((E*F/2-D*kzin).^2/(D.^4*kzin.^4)+((D*F*kzin-E.^2)/3).^3/(D.^6*kzin.^6))+(E*F/2-D*kzin)/(D.^2*kzin.^2)).^(1/3)+E./(D*kzin);
%Teste
T = (sqrt((E*F/2-D*K).^2/(D.^4*K.^4)+((D*F*K-E.^2)/3).^3/(D.^6*K.^6))+(E*F/2-D*K)/(D.^2*K.^2)).^(1/3)+(-sqrt((E*F/2-D*K).^2/(D.^4*K.^4)+((D*F*K-E.^2)/3).^3/(D.^6*K.^6))+(E*F/2-D*K)/(D.^2*K.^2)).^(1/3)+E./(D*K);
plot(K,T)