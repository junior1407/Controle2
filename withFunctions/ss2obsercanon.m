function [Ao,Bo,Co,Do] = ss2obsercanon(A,B,C,D)
    %Making sure it is on controller form
    [num,den] = ss2tf(A,B,C,D);
    [Ac,Bc,Cc,Dc] = tf2ss(num,den);
    Ao= Ac';
    Bo=Cc';
    Co= Bc';
    Do=D;
end