function tab = main(n)

    dir_rut='imagenes\8bit\';

    tab=zeros(2,4);

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

        tab(1,:)=tab(1,:)+[total/n,amb/n,psnr/n,c/n];

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
        
        tab(2,:)=tab(2,:)+[total/n,amb/n,psnr/n,c/n];

    end
 
    fprintf('\t\t\tT(s)\t\tAMBE\t\t\tPSNR\t\tContraste\n');

    fprintf('BHE2PL     %3f    %3f      %3f      %3f      %3f',tab(1,1),tab(1,2),tab(1,3),tab(1,4));

    fprintf('\n');
    
    fprintf('HE         %3f    %3f      %3f      %3f      %3f',tab(2,1),tab(2,2),tab(2,3),tab(2,4));

    fprintf('\n');
    % tab

end