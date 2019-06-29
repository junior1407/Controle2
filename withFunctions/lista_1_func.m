clc;
clear all;
close all;

b=50;
m=1000;
A= [0 1; 0 -b/m];
B= [0;1/m];
C= [0 1];
D = 0;

SS= ss(A,B*500, C,D);
step(SS);

