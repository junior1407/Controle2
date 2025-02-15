clc;
clear all;
close all;
A=[0 1 0; 0 0 1; -6 -11 -6];
B=[0;0;6];
C= [1 0 0];
D= 0;
sys = ss(A,B,C,D);
[Adt,Bdt,Cdt,Ddt] = ssdata(canon(sys,'modal'))

[P,d]=eig(A)
Adt2=inv(P)*A*P % Calculate diagonal system A.
Bdt2=inv(P)*B % Calculate diagonal system B.
Cdt2=C*P % Calculate diagonal system C.
Ddt2 = D;

[num,den] = ss2tf(A,B,C,D);
[Ac, Bc, Cc, Dc] = tf2ss(num,den);
Ao= Ac';
Bo=Cc';
Co= Bc';
Do=D;



