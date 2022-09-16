function AMB= AMBE(f,i)

    meanorigin=mean2(f);
    meanmodif=mean2(i);
    AMB = abs(meanorigin - meanmodif);

end