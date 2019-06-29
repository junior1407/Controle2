function [wn, zeta] = tf_wn_zeta(T)

%[num_temp,den_temp] = tfdata(T) 
den_temp = T.denominator;
den_temp = den_temp{:}
wn = sqrt(den_temp(3))
zeta = den_temp(2)/(2*wn)
end