function y = isctrlb(SS)
y=0;
if rank(ctrb(SS))== length(SS.a) 
    y=1;
end


end