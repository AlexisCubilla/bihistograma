function splu = splu(hi,min,max)

    splu = 0;
    Nlu = 0;
 
        for k = min:max
            splu = splu + ( hi(k+1,1) * hi(k+1,2));
            Nlu = Nlu + hi(k+1,2);
        end
        splu = splu / Nlu;
        Nlu

    end
