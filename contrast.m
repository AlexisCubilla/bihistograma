function c=contraste(pdf,brillo)
    c=0;
    [x,y]=size(pdf);
    for i=1:x
        c= c + (i-1-brillo)^2 * pdf(i,2);
    end
    c=sqrt(c);
end