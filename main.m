function img2 = main(img)

    s = size(img);
    if( length(s) > 2 )
        img = rgb2gray(img);
    end

    [img2,ult] =  BHE2PL(img);

    figure;imshow(img);title('original');figure;imshow(img2);title('modificado');

    amb= AMBE(img,img2); %diferencia de brillos

    psnr= PSNR(img,img2,ult);

    amb

    psnr

end