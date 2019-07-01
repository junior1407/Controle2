% Nise, N.S. 
% Control Systems Engineering, 6th ed. 
% John Wiley & Sons, Hoboken, NJ, 07030
%
% Control Systems Engineering Toolbox Version 6.0 
% Copyright © 2011 by John Wiley & Sons, Inc.

% TryIt 12.4
% Use MATLAB, the Control System Toolbox, and the
% following statements to solve Skill-Assessment 
% Exercise 12.5.

'TryIt 12.4'
A=[-2 -1 -3
    0 -2 1
    -7 -8 -9]
C=[4 6 8]
Om=obsv(A,C)
Rank=rank(Om)