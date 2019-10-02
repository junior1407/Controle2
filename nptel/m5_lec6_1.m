clc; clear all; close all;

%Função de transferência (plano z)
Gz = tf([0.0187,0.0175],[1 -1.8187 0.8187],0.2)

%passando para o plano w
Gs = d2c(Gz,'tustin')

%Projetar um compensador de fase para que o PM do sistema compensado seja
%pelo menos 500 com Kv = 2, temos que o compensador no plano s é:

%O compensador é dado por:
syms Tau Alfa K s
Cs = K*(Tau*s + 1)/(Alfa*Tau*s + 1)
%Como,
%Kv = lim s->0 1/(sCs(s)Gs(s)) = 2 -> K = 2
K = 2;

%A margem de fase do sistema com K = 2 nos dá uma fase de 31,60° com ?g =
%1,26 rad/s, conforme o plot abaixo:
figure(1)
margin(K*Gs)
pmK = 31.6;

%Assim, a fase necessária é de 50° - 31,6° = 18,4°. 
pm = 50 - pmK;

%Depois de adicionar uma margem de segurança de 11,6°, fasemax torna-se 30°. Assim,
faseMax = pm + 11.6;

%Que nos dá alfa:
alfa = ((1-sin(faseMax*pi/180))/(1+sin(faseMax*pi/180))) %ângulos devem estar em radianos

%A partir da resposta de frequência do sistema, no diagrama de bode,pode-se descobrir que em ? = 1,75 rad/s,
%a magnitude do sistema é de -20log10(1/sqrt(alfa))
magMax = -20*log10(1/sqrt(alfa));

%Logo,
wmax = 1.74;

%De, wmax = wgew = 1/(tau*sqrt(alfa)), temos:
tau =  1/(wmax*sqrt(alfa))

%Desse modo, o compensador Cs será:
Cs = K*tf([tau 1],[alfa*tau 1])

%Plotando resultado do sistema compensado
figure(2)
margin(Cs*Gs)

%Re-transformando o controlador acima no plano z usando a relação, usando a
%função c2d
Cz = c2d(Cs,0.2,'tustin')