function y = isobservlb(SS)
y=0;
if rank(obsv(SS))== length(SS.a) 
    y=1;
end


end