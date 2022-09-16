function re = main(n)

    dir_rut='imagenes\8bit\';

    tabla=zeros(2,3);

    for i= 1:n

        dir= strcat(dir_rut,num2str(i),'.png');
        img=imread(dir);
        
        % algoritmo BHE2PL

        tiempo_inicio = cputime;
        [img2,ult] =  BHE2PL(img);
        total = cputime - tiempo_inicio;
        
        amb=AMBE(img,img2);
        psnr=PSNR(img,img2,ult);

        tabla(1,:)=tabla(1,:)+[total,amb,psnr;

        % algoritmo HE

        tiempo_inicio = cputime;
        img2=histeq(img);
        total = cputime - tiempo_inicio;

        amb=AMBE(img,img2);
        psnr=PSNR(img,img2,ult);
        
        tabla(2,:)=tabla(2,:)+[total,amb,psnr];

    end

    re=tabla;

end