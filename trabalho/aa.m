%------------------------------
% ATV 4 - Controlador dead beat
%------------------------------

%Funcao de transferencia
num = [0.05*poly([-0.5])];
den = poly([0.9 0.8 0.35]);
Gz = tf(num,den,0.1)

%Excesso de polos sobre o zero de Gz
n = length(den) - length(num) 

%Resposta ao degrau -> Mz = 1/z^n
Mz = tf(1,[1 0 0],0.1);

%Controlador dead beat
Cz = (1/Gz) * (Mz/(1-Mz))

%Resposta ao degrau
%Sistema controlado
Tz = (Cz*Gz)/(1 + Cz*Gz)
step(Tz,1,'m')
hold on
%Sistema sem controlador
step(Gz,1,'g')