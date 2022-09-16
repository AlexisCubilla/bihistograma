function img2= img_modif(img,ec)

    [x,y] = size(img);
    
    img2 = img;
    
    for i=1:x
        for j=1:y
            v= img(i,j)+1;
            img2(i,j)=ec(v,2);
        end
    end

end 