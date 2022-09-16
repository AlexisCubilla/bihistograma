function rmain = main(img)

    s = size(img);
    if( length(s) > 2 )
        img = rgb2gray(img);
        s = size(img);
        % imshow(img) ;
    end

    [count,label]=imhist(img);
    h = [label, count]
    % imhist(img);

    total = s(1)*s(2);


    pk_matriz = pk(h, total);
    
    
    sp = SP(h, pk_matriz)

    % plot(label,cantidad)

    plot(h(:,1),h(:,2), "-" )
    xline(SP(h, pk_matriz),'red')
 

    % [lmax,y] = size(h);
    % lmax = lmax -1;
    lmin = h(1,1)
    lmax = h(end,1)

    spl = splu(h, lmin,round(sp))
    spu = splu(h, round(sp+1),lmax)
   
    [grl1, grl2, gru1, gru2] = GR(sp, spl, spu,lmin, lmax )
    
    [pll1,pll2] = PL(h(lmin+1:round(sp+1),:), grl1, grl2)
    [plu1,plu2] = PL(h(round(sp+2):lmax+1,:), gru1, gru2)

    

    % yline(pll1)
    line([0 sp],[pll1 pll1],'color','blue')
    line([0 sp],[pll2 pll2],'color','blue')
    line([sp+1 lmax],[plu1 plu1],'color','blue')
    line([sp+1 lmax],[plu2 plu2],'color','blue')
    % plot(lmin +1: round(sp),pll1)
  


end