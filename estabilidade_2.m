clc;
clear all;
D=1.395e4;
E=111.6;
F=16.74;
%K  = 0.01:0.001:;
Kzin = 1;
Tzin = 0.2;

%Elemento da coluna que deve ser > 0 
B =  (16*E*F*Tzin-16*E^2*Tzin^2 -16*D*Kzin*Tzin - 8*D*F*Kzin*Tzin^2 + 24*D*E*Kzin*Tzin^3 - 8*D^2*Kzin^2*Tzin^4)/(4*E - 4*D*Kzin*Tzin);


T = (sqrt((E*F/2-D*K).^2/(D.^4*K.^4)+((D*F*K-E.^2)/3).^3/(D.^6*K.^6))+(E*F/2-D*K)/(D.^2*K.^2)).^(1/3)+(-sqrt((E*F/2-D*K).^2/(D.^4*K.^4)+((D*F*K-E.^2)/3).^3/(D.^6*K.^6))+(E*F/2-D*K)/(D.^2*K.^2)).^(1/3)+E./(D*K);
plot(K,T)