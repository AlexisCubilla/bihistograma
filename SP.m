function spr = SP(hi,pk_matriz)
    %   SP calcula la intensidad media del histograma global
    %   parametro de entrada, hi es la frecuencia de intensidad [label, cantidad]
    %   total es la dimension de la imagen M X N 
    %   utiliza la funcion pk que retorna la matriz [label, probabilidadOcurrencia]
    %   spr, retorna la sumatoria de pk * k
    [x, y] = size(hi);
    x
    spr = 0;
    for i = 1:x
        spr = spr + (pk_matriz(i, 2) * hi(i, 1));
    end
 
end
