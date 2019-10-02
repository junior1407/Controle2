clc;
clear all;
close all;
%Z = tf('z', 1);
%Z_1 = 1/Z;
%z = tf('z',1);
%z_1 = 1/z;
syms Z_1 z_1_ z_
H_Z = (0.001836*(1+Z_1)^4)/((1-1.5548*Z_1 + 0.6493 * Z_1^2)*(1-  1.4996*Z_1 + 0.8482*Z_1^2))

%thetap = frequencia de corte em Z
%wp = frequencia de corte em z

theta_p =0.2*pi;  
w_p  = 0.6 * pi;  
alfa = - cos((theta_p+w_p)/2)/cos((theta_p-w_p)/2);

% Alterando da variavel simbolica Z_1(1/Z) para a variavel simbolica
% z_1(1/z)
step1= subs(H_Z, Z_1, -(z_1_ + alfa)/(1+alfa*z_1_));

%alterando da variavel simbolica z_1(1/z) para a variavel simbolica z_
step2 = subs(step1,z_1_, 1/z_);
[num,den] =numden(step2);
num_tf = sym2poly(num);
den_tf = sym2poly(den);
sys = tf(num_tf, den_tf);
%[b,a] = tfdata(H_Z,'v');
freqz(num_tf,den_tf)
ylim([-100 20])
%[h,w] = freqz(b,a,'whole',2001);
%H_z = subs(
%teste = y = filter(b,a,x);