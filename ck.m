function c=ck(pk)
    [x,y] = size(pk);
    c = zeros(x,y);
    c(1,:)= pk(1,:);
    for i=2:x
        c(i,2) = c(i-1,2)+pk(i,2) ;
        c(i,1) = pk(i,1);
    end
end