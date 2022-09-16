function pk = p(hi, total)
    [x,y] = size(hi);
    pk = zeros(x,y);
    for i=1:x
        pk(i,2) = hi(i,2)/ total;
        pk(i,1) = hi(i,1);
    end
end