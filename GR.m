function [grl1, grl2, gru1, gru2] = GR(sp, spl, spu, lmin, lmax)
    grl1 = (sp - spl) / (sp - lmin);
    if grl1 > 0.5
        dl = (1 - grl1) / 2;
    else 
        dl = grl1 /2 ;
    end
    grl2 = grl1 + dl;
    gru1 = (lmax - spu) / (lmax-sp);
    if gru1 > 0.5
        du = (1 - gru1) / 2;
    else    
        du = gru1 / 2;
    end
    gru2 = gru1 + du;
end
