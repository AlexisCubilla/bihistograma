
function main = main(img)

    s = size(img);

    if( length(s) > 2 )
        
        img = rgb2gray(img);
        s = size(img);
        
    
    end

    [count,label]=imhist(img);

    h=[label,count];

    main =p(h,s(1)*s(2));
    
    function pk = p(hi,total)

        [x,y]= size(hi);

        pk=zeros(x,y);

        count=0;

        for i=1:x
            pk(i,2)=hi(i,2)/total;
            pk(i,1)=hi(i,1);
            
        end
    
    end

end
