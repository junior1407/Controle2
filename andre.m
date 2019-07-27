clear all; clc

syms K T z;

E = 111.6;
F = 16.74;
D = 1.395*10^-4;

a3 = 1;
a2 = E * T^2 + F * T - 3;
a1 = 3 - 2*F*T + D * K * T^3;
a0 = D * K *T^3 + F * T - E * T^2 -1;

F = z^3 + a2*z^2 + a1*z + a0;

%Condições de estabilidade Jury
F1 = subs(F,z,1);
F_1 = subs(F,z,-1);
b0 = det([a0 a3;a3 a0]);
b1 = det([a0 a2;a3 a1]);
b2 = det([a0 a1;a3 a2]);

T_ = 0.002:0.001:0.12;
Tmax = solve(F_1);
% 
% for i=1:1:length(T_)
%     current_a0 = subs(a0,T,T_(i));
%     current_b0 = subs(b0,T,T_(i));
%     current_b2 = subs(b2,T,T_(i));
%     
% %     K1(i) = solve(current_a0<1);
% %     R = solve(current_b0>current_b2);
% %     K2(i) = R(1);
% end
% 
% subplot(2,2,[1 2])
% plot(T_,K1,'r',T_,K2,'b')
% axis([0 inf 6e+06 50e+06]);
% grid on
% 
% subplot(2,2,3)
% plot(T_,K1,'r')
% grid on
% 
% subplot(2,2,4)
% plot(T_,K2,'b')
% grid on
% 
% %Código para pintar área entre.
% x2 = [T_, fliplr(T_)];
% inBetween = [zeros(length(T_)), fliplr(K2)];
% fill(x2, inBetween, 'g');
% 
% %Código para testar um par (t,k) 
% current_b0 = subs(b0,T,0.1);
% current_b2 = subs(b2,T,0.1);
% r = solve(current_b0>current_b2);
% hold on
% plot(0.1,r(1),'r')