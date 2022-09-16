function rmain = main(img)

    s = size(img);
    if( length(s) > 2 )
        img = rgb2gray(img);
        s = size(img);
        % imshow(img) ;
    end

    [count,label]=imhist(img);
    h = [label, count];
    imhist(img);

    total = s(1)*s(2);


    pk_matriz = pk(h, total);
    
    
    sp = SP(h, pk_matriz);

    % plot(label,cantidad)

    plot(h(:,1),h(:,2), "-" );
    xline(SP(h, pk_matriz),'red');
 

    % [lmax,y] = size(h);
    % lmax = lmax -1;
    lmin = h(1,1);
    lmax = h(end,1);

    spl= splu(h(1:round(sp),:));
    spu = splu(h(round(sp+1):end,:));
   
    [grl1, grl2, gru1, gru2] = GR(sp, spl, spu,lmin, lmax );
    
    [pll1,pll2] = PL(h(1:round(sp),:), grl1, grl2);
    [plu1,plu2] = PL(h(round(sp+1):end,:), gru1, gru2);

    

    % yline(pll1)
    % line([0 sp],[pll1 pll1],'color','blue')
    % line([0 sp],[pll2 pll2],'color','blue')
    % line([sp+1 lmax],[plu1 plu1],'color','blue')
    % line([sp+1 lmax],[plu2 plu2],'color','blue')



    [hl,NL]=TRANSF(h(lmin+1:round(sp+1),:),pll1,pll2);

    [hu,NU]=TRANSF(h(round(sp+2):lmax+1,:),plu1,plu2);

    h_trans=h;

    hold on; plot(h_trans(:,1),h_trans(:,2), "-" );

    hold off;

    pk_l = pk(hl,NL);
    pk_u = pk(hu,NU);

    ck_l=ck(pk_l);
    ck_u=ck(pk_u);

    ec_l=ecualizador(hl,ck_l,pk_l);
    ec_u=ecualizador(hu,ck_u,pk_u);

    [eclx,ecly]=size(ec_l);
    [ecux,ecuy]=size(ec_u);

    ec=zeros(eclx+ecux,2);

    ec(1:eclx,:)=ec_l;

    ec(eclx+1:end,:)=ec_u;

    img2=img_modif(img,ec);

    % figure;imshow(img2);

    rmain=img2;


    figure;imshow(img);title('original');figure;imshow(img2);title('modificado');

    

    % ec_l;

    % ck_u

    % hl
    % hu
    % % h_trans
    % sp

    % ec

    % ec_l

    % ec_u

    % ec(ec_l(1,1)+1,ec_l(end,1)+1)=ec_l;
    % ec(ec_u(1,1)+1,ec_u(end,1)+1)=ec_u;


    
    % img_modif=zeros(s(1),s(2));




    % figure;imshow(ec_l);



end