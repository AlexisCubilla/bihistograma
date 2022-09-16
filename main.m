function re = main(n)

    dir_rut='imagenes\8bit\';

    tabla=zeros(2,4);

    ult=255;

    for i= 1:n

        dir= strcat(dir_rut,num2str(i),'.png');
        img=imread(dir);
        
        % algoritmo BHE2PL

        tiempo_inicio = cputime;
        img2 =  BHE2PL(img);
        total = cputime - tiempo_inicio;
        
        [M,N] = size(img2);
        amb=AMBE(img,img2);
        psnr=PSNR(img,img2,ult);

        [count,binLocation]=imhist(img2);

        pk1=pk([binLocation,count],M*N);

        brillo=mean2(img2);

        c=contrast(pk1,brillo);

        % e=entropy(pk1);

        tabla(1,:)=tabla(1,:)+[total/n,amb/n,psnr/n,c/n];

        % algoritmo HE

        tiempo_inicio = cputime;
        img2=histeq(img);
        total = cputime - tiempo_inicio;

        [M,N] = size(img2);
        amb=AMBE(img,img2);
        psnr=PSNR(img,img2,ult);

        [count,binLocation]=imhist(img2);

        pk1=pk([binLocation,count],M*N);

        % e=entropy(pk1);

        brillo=mean2(img2);

        c=contrast(pk1,brillo);
        
        tabla(2,:)=tabla(2,:)+[total/n,amb/n,psnr/n,c/n];

    end
    re=tabla;

    fprintf('      T(s)     AMBE     PSNR    Contraste\n');
    re
end