% Nise, N.S. 
% Control Systems Engineering, 6th ed. 
% John Wiley & Sons, Hoboken, NJ, 07030
%
% Control Systems Engineering Toolbox Version 6.0 
% Copyright © 2011 by John Wiley & Sons, Inc.

% TryIt 12.3
% Use MATLAB, the Control System Toolbox, and the
% following statements to solve Skill-Assessment 
% Exercise 12.4.

'TryIt 12.3'
A=[-24 1 0
-191 0 1
-504 0 0]
C=[1 0 0]
pos=20
Ts=2
z=(-log(pos/100))/...
(sqrt(pi^2+...
log(pos/100)^2));
wn=4/(z*Ts);
r=roots([1,2*z*wn,...
    wn^2]);
poles=10*[r' 10*...
    real(r(1))]
l=acker(A',C',poles)'