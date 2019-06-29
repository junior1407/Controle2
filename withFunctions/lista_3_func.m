clear all; 
clc;
close all;
num = [ 25.04 5.008];
den=[1 5.03247 25.1026 5.008];

'Controller canonical form' 
[Ac, Bc, Cc,Dc] = tf2ss(num,den)
sys = ss(Ac,Bc,Cc,Dc);

'Phase-variable form'  
[Ap, Bp, Cp,Dp]=ss2phv(Ac,Bc,Cc,Dc)

'Controllability'
isctrlb(sys)