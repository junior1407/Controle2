% Nise, N.S. 
% Control Systems Engineering, 6th ed. 
% John Wiley & Sons, Hoboken, NJ, 07030
%
% Control Systems Engineering Toolbox Version 6.0 
% Copyright © 2011 by John Wiley & Sons, Inc.

% TryIt 12.2
% Use MATLAB, the Control System Toolbox, and the
% following statements to solve Skill-Assessment
% Exercise 12.2.

'TryIt 12.2'
A=[-1 1 2
    0 -1 5
    0 3 -4]
B=[2;1;1]
Cm=ctrb(A,B)
Rank=rank(Cm)