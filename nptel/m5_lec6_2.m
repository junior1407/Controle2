clc; clear all; close all;

%Fun��o de transfer�ncia
Gs = tf(1,conv([1 0],[1 1]))

%O compensador � dado por:
syms Tau Alfa K s
Cs = K*(Tau*s + 1)/(Alfa*Tau*s + 1)

%Quando s->0, temos que C(s) -> K, pois:
Cs0 = subs(Cs,s,0)

%O erro de estado estacion�rio p/ uma entrada do tipo rampa � ess = 1/lim
%s->0 (1/(s*Cs*Gs)) = 1/K = 0.1 -> K = 10
k = 10;

%Substituindo s por jw, temos que:
Gsimb = poly2sym(1,s)/poly2sym(conv([1 0],[1 1]),s); %Convertendo de tf para sym
syms w
Gjw = subs(Gsimb,s,i*w)

Mag = k*norm([real(Gjw) imag(Gjw)]); 
Fase = atan(imag(Gjw)/real(Gjw));
%Obtemos a frequ�ncia de crossover wg para o sistema descompensado com
%ganho K como Mag = 1, logo:
wg = solve(Mag-1,w)
pmK = subs(Fase,w,wg);
pmK = double(pmK*180/pi) %Convertendo de radianos para grau

%� poss�vel adicionar uma fase sem alterar a maginitude, a PM necess�ria � dada por:
pm = 45-pmK;

% adicionando uma margem de 10
pm = pm + 10

%Assim, faseMax = pm;
faseMax = pm;

%Que nos d� alfa:
alfa = ((1-sin(faseMax*pi/180))/(1+sin(faseMax*pi/180))) %�ngulos devem estar em radianos

%Deve-se localizar a frequ�ncia na qual o sistema n�o compensado tem uma magnitude 
%logar�tmica de -20log10(1/sqrt(alfa))
%wmax = solve(Mag-(-20*log10(1/sqrt(alfa))),w);
magMax = -20*log10(1/sqrt(alfa))

%Plotamos o diagrama de Bode e verificamos o ponto onde a maginitude � de
%magMax para obter wmax = wgnew
figure(1)
margin(k*Gs)

%Logo,
wmax = 4.42;

%De, wmax = wgew = 1/(tau*sqrt(alfa)), temos:
tau =  1/(wmax*sqrt(alfa))

%Desse modo, o compensador Cs ser�:
CsK = subs(Cs,K,k);
CsT = subs(CsK,Tau,tau);
CsAlfa = subs(CsT,Alfa,alfa);

Cs = simplify(CsAlfa);

%De modo mais simplificado:
Cs = k*tf([tau 1],[alfa*tau 1])

%Plotando resultado do sistema compensado
figure(2)
margin(Cs*Gs)