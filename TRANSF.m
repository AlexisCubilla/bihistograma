function [h2,NLU] = transf(hi,pllu1,pllu2)

    [x,y] = size(hi);
    h2 = zeros(x,y);
    % h2(:,1)=hi(:,1);
    NLU=0;
    for k=1:x
        if(hi(k,2)<=pllu2)
            h2(k,2)=pllu1;
            
            
        else
            h2(k,2)=pllu2;
        end
        h2(k,1)=hi(k,1);

        NLU=NLU+h2(k,2);
    end
end