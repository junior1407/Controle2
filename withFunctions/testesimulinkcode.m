clc;
clear all;
A = [0 1 0;980  0  -2.8;0   0  -100 ];
B = [ 0;0;100];
C = [ 1 0 0 ];
D=0;

[A_c, B_c, C_c, D_c] = designController(A,B,C,D, [-20+20i -20-20i -100]);
K = [-775.7143 -20.6429 0.4000];
[A_o,B_o, C_o, D_o] = designObserver(A,B,C,D,[-100 -101 -102 ])
L =[203;31582;1128200];