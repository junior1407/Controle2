syms K T D E F
A3 = 2 * D*K*T^3;
A2 = 4*E*T^2 - 4*D*K*T^3;
A1 = 2*D*K*T^3-4*E*T^2+4*F*T;
A0 = 8-4*F*T;
routhy([A3 A2 A1 A0])
