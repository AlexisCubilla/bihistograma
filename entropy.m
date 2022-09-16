function c=entropy(pdf)
    c=0;
    [x,y]=size(pdf);
    pdf 
    for i=1:x

        c= c + pdf(i,2) * log10(double(pdf(i,2)));
    end
end