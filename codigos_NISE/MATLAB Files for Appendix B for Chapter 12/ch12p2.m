% Nise, N.S. 
% Control Systems Engineering, 6th ed. 
% John Wiley & Sons, Hoboken, NJ, 07030
%
% Control Systems Engineering Toolbox Version 6.0 
% Copyright © 2011 by John Wiley & Sons, Inc.
%
% (ch12p2) Example 12.2: We can test controllability by using the MATLAB command
% Cm = ctrb(A,B) to find the controllability matrix given the system matrix (A) 
% and the input matrix (B). This command is followed by rank(Cm) to test 
% the rank of the controllability matrix (Cm). Let us apply the commands to 
% Example 12.2.

'(ch12p2) Example 12.2'             % Display label.
A=[-1 1 0;0 -1 0;0 0 -2]            % Define compensated A matrix.
B=[0;1;1]                           % Define compensated B matrix.
Cm=ctrb(A,B)                        % Calculate controllability matrix.
Rank=rank(Cm)                       % Find rank of controllability 
                                    % matrix.
