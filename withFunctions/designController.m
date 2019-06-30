function [A_new, B_new, C_new, D_new] = designController(A,B,C,D, polosDesejados)
       if (size(A,1)== size(polosDesejados,2))
           
           %N precisa de integrador
           K = acker(A,B,polosDesejados);
           A_new=A-B*K;
           B_new=B;
           C_new=C;
           D_new=D;
       else
           %precisa de integrador
            [num,den] = ss2tf(A,B,C,D);
            den = conv(den,[1 0]); %Adiciona integrador
            
            [A1,B1,C1,D1] = tf2ss(num,den);
            K_Ke = acker(A1,B1,polosDesejados);

            K= K_Ke(1:end-1); %Separei só os K
            Ke= K_Ke(end); % Separei só o Ke

            A_new = [ A-B*K B*Ke; -C 0];
            B_new = [zeros(size(B,1),1);1];
            C_new = [C 0];
            D_new = D;
       end
            
end