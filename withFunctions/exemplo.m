clc;
clear all;
A = [0 1; -3 -5];
B = [0;1];
C = [1 0];
D=0;
[num,den] = ss2tf(A,B,C,D);
tf(num,den)
pos=10; 
Ts=0.5;% Input desired settling time.
z=(-log(pos/100))/(sqrt(pi^2+log(pos/100)^2));
                                    % Calculate required damping ratio.
wn=4/(z*Ts); 
[num_esp,den_esp]=ord2(wn,z);  
Tf_esp = tf(num_esp,den_esp);
polos_desejados = roots(den_esp)';
acker(A,B,polos_desejados)