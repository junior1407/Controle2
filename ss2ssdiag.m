function [Adt,Bdt,Cdt,Ddt] = ss2ssdiag(A,B,C,D)
% Jeito 1
%sys = ss(A,B,C,D);
%[Adt,Bdt,Cdt,Ddt] = ssdata(canon(sys,'modal'))

%Jeito2

[P,d]=eig(A);
Adt=inv(P)*A*P; % Calculate diagonal system A.
Bdt=inv(P)*B; % Calculate diagonal system B.
Cdt=C*P; % Calculate diagonal system C.
Ddt = D;

end



