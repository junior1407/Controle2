clear all; 
clc
s = tf('s');
num = [ 25.04 5.008];
den=[1 5.03247 25.1026 5.008];

'Controller canonical form' 
[Ac, Bc, Cc,Dc] = tf2ss(num,den);
sys = ss(Ac,Bc,Cc,Dc);

'Phase-variable form'  
P=[0 0 1;0 1 0;1 0 0];
Ap=inv(P)*Ac*P;                       % Form A matrix, phase-variable form.
Bp=inv(P)*Bc;                         % Form B vector, phase-variable form.
Cp=Cc*P;                              % Form C vector, phase-variable form.
Dp=Dc;                                % Form D phase-variable form.

'Controllability'
ctrb(sys) %Controllability matrix
rank(ctrb(sys)) %rank
length(Ac)