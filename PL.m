function [pl1,pl2] = PL(hi, gr1, gr2)

    piko = max(hi(:,2));
    pl1 = gr1 * piko ;
    pl2 = gr2 * piko;

end