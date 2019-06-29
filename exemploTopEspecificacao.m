clc
clear all
num = [1];
den = [1 3];
Gs = tf(num,den);
[A,B,C,D] = tf2ss(num, den);

pos=10;   % Input desired percent overshoot.
Ts=0.5;% Input desired settling time.
z=(-log(pos/100))/(sqrt(pi^2+log(pos/100)^2));
                                    % Calculate required damping ratio.
wn=4/(z*Ts);                        % Calculate required natural 
                                    % frequency.
[num_esp,den_esp]=ord2(wn,z);  
Hs = tf(num_esp, den_esp)
K = acker(A, B, [-5])