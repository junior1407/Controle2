clc;
clear all;
close all;
syms t tau;
'Fi(t)'                      % Display label.
Fi=[(2*exp(-t)-exp(-2*t)) (exp(-t) -exp(-2*t));(-2*exp(-t) + 2*exp(-2*t)) (-exp(-t) +2*exp(-2*t))];    % Form state transition-matrix, Fi(t).
x_0 = [1;0];
Fitmtau=subs(Fi,t,t-tau);   
x = Fi*x_0 + int(Fitmtau*B*1,thau,0,t);
%Simular
%Definir condicoes inicias de x1 e x2
% t = 1/8
%xdot(t) = A * x(t)

%pretty(Fi)                   % Pretty print state-transition matrix, Fi(t).

%%Fi(t-tau)'                  % Display label.
%pretty(Fitmtau)              % Pretty print Fi(t-tau).
%x=Fi*X0+int(Fitmtau*B*1,tau,0,t);
                             % Solve for x(t).    
