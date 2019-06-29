function [A, B, C]=ode2phv(ai, k)

%  This function converts an nth order ordinary differential equation:
%  a(n) d^nx/dt^n + a(n-1) d^(n-1)x/dt^(n-1) + . . + a(1)dx/dt + a(0)x = k
%  to the state-space phase variable form.

% 2y''' + 4y'' + 6y' + 8 y = 10 * u
%[A,B,C] = ode2phv([2,4,6,8],10);
%
%
n=length(ai)-1;
I =eye(n-1);
z=zeros(n-1,1);
zi=[z,I];
for m=1:n
    an(m)=-ai(n+2-m)/ai(1);
end
A=[zi;an];
B=[z;k/ai(1)];
C=[1 z'];