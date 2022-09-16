function f= ecualizador(h,ck,pk)

    [x,y] = size(h);
    f = zeros(x,y);
    f(:,1)=h(:,1);
    x0=h(1,1);
    xend=h(end,1);
    for k=1:x
        
        f(k,2)=x0+(xend-x0)*(ck(k,2)-0.5*pk(k,2));

    end
end
