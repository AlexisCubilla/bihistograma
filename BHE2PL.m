function [img2] = BHE2PL(img)

    s = size(img);

    if( length(s) > 2 )
        img = rgb2gray(img);
        s = size(img);
    end


    [count,label]=imhist(img);
    
    h = [label, count];

    total = s(1)*s(2);

    pk_matriz = pk(h, total);
    
    sp = SP(h, pk_matriz);

    plot(h(:,1),h(:,2), "-" );title('histograma');

    xline(SP(h, pk_matriz),'red');
 
    lmin = h(1,1);
    lmax = h(end,1);

    spl= splu(h(1:round(sp+1),:));
    spu = splu(h(round(sp+2):end,:));
   
    [grl1, grl2, gru1, gru2] = GR(sp, spl, spu,lmin, lmax );
    
    [pll1,pll2] = PL(h(1:round(sp+1),:), grl1, grl2);
    [plu1,plu2] = PL(h(round(sp+2):end,:), gru1, gru2);

    
    line([0 sp],[pll1 pll1],'color','blue');
    line([0 sp],[pll2 pll2],'color','blue');
    line([sp lmax],[plu1 plu1],'color','blue');
    line([sp lmax],[plu2 plu2],'color','blue');

    [hl,NL]=TRANSF(h(lmin+1:round(sp+1),:),pll1,pll2);
    [hu,NU]=TRANSF(h(round(sp+2):lmax+1,:),plu1,plu2);

    h_tr=h;

    h_tr(lmin+1:round(sp+1),:)=hl;

    h_tr(round(sp+2):lmax+1,:)=hu;
        
    % hold on; plot(h_tr(:,1),h_tr(:,2),'-');

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

end