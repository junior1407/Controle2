function [A_new,B_new, C_new, D_new] = designObserver(A,B,C,D,polos)
    [Ao,Bo,Co,Do] = ss2obsercanon(A,B,C,D)
    L = acker(Ao',Co',polos)';
    A_new = Ao-L*Co;
    B_new = Bo;
    C_new = Co;
    D_new = Do;
end