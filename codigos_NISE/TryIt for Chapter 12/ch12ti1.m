% Nise, N.S. 
% Control Systems Engineering, 6th ed. 
% John Wiley & Sons, Hoboken, NJ, 07030
%
% Control Systems Engineering Toolbox Version 6.0 
% Copyright © 2011 by John Wiley & Sons, Inc.

% TryIt 12.1
% Use MATLAB, the Control System Toolbox, and the
% following statements to solve feedback gains to 
% place the poles of the system in Skill-
% Assessment Exercise 12.1 at -3+j5, -3 -j5, and -10.

'TryIt 12.1'
A=[0 1 0
    0 0 1
    0 -36 -15]
B=[0;0;1]
poles=[-3+5j,...
-3-5j,-10]
K=acker(A,B,poles)