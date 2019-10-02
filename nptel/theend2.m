clc;
clear all;
z = tf('s');
z_1 = 1/z;

tfs = (0.02426 *(1-z_1)^4 )/ ((1+1.0416*z_1 + 0.4019 * z_1^2)*(1+ 0.5661 * z_1 + 0.7657*z_1^2));
%b,a
[num,den] = tfdata(tfs,'v');


%1º plot
figure(1)
freqz(num, den)
ylim([-100 20])


%2º plot
figure(2)
[amplitude,frequencia] = freqz(num, den);
plot(abs(amplitude)) %falta ajustar eixo e legenda
	

%3º Plot
figure(3)
N = 1024 % N de amostras
grpdelay(num,den, 1024) %Falta ajustar eixo e legenda