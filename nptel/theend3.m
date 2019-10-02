clc;
clear all;
syms z 
H_Z = (0.001836*(1+Z_1)^4)/((1-1.5548*Z_1 + 0.6493 * Z_1^2)*(1-  1.4996*Z_1 + 0.8482*Z_1^2))

z_1_simb = poly2sym([0 1],z)/poly2sym([1 0],z); %Convertendo de tf para sym
H_z_1 = subs(H_Z, Z_1, -(z_1_simb + alfa)/(1+alfa*z_1_simb));

[n,d] = numden(H_z_1);
num = sym2poly(n);
den = sym2poly(d);


freqz(num,den)