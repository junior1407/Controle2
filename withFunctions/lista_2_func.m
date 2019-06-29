clc;
clear all;
close all;

A=[0 1 0; 0 0 1; -6 -11 -6];
B=[0;0;6];
C= [1 0 0];
D= 0;
'Diagonal Form';
[Adt,Bdt,Cdt,Ddt] = ss2ssdiag(A,B,C,D);

'Transfer Function';
[num,den] = ss2tf(A,B,C,D);

'Observer form'
[Ao,Bo,Co,Do] = ss2obsercanon(A,B,C,D)




