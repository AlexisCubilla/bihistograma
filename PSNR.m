function psnr= PSNR(origin,modif,ult)

    [m,n] = size(origin);
    
    mse=0;

    for i= 1:m
        for j=1:n
            mse = mse + (double(origin(i,j))-double(modif(i,j)))^2;
        end
    end

    mse = mse/(m*n);
    mse = ult^2/mse;
    psnr = 10*log10(mse);

end