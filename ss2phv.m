function [Ap, Bp, Cp,Dp]=ss2phv(A,B,C,D)

%Making sure it is on controller form
[num,den] = ss2tf(A,B,C,D);
[Ac,Bc,Cc,Dc] = tf2ss(num,den);

tam = size(A);
tam = tam(1)
'Phase-variable form'  
P = rot90(eye(tam))
Ap=inv(P)*Ac*P;                       % Form A matrix, phase-variable form.
Bp=inv(P)*Bc;                         % Form B vector, phase-variable form.
Cp=Cc*P;                              % Form C vector, phase-variable form.
Dp=Dc;                                % Form D phase-variable form.