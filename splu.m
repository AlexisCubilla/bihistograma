function splu = splu(hi)

    [min,max]=size(hi);
    splu = 0;
    Nlu = 0;

        for k = 1:min
            splu = splu + ( hi(k,1) * hi(k,2));
            Nlu = Nlu + hi(k,2);
        end
        splu = splu / Nlu;

    end
