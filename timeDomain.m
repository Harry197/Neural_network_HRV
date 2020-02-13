function [MRR,RMSSD,SDSD,SDNN,pNN50] = timeDomain(diffRR)
%%==============================MRR======================================%%
MRR = mean(diffRR);
%%=============================RMSSD=====================================%%
for i=1:length(diffRR)-1
    difDiffRR(i) = abs(diffRR(i) - diffRR(i+1));
end
douDifDiffRR=difDiffRR.^2;
RMSSD=mean(douDifDiffRR);
RMSSD=sqrt(RMSSD);
%%==============================SDNN=====================================%%
for i=1:length(diffRR)
    difMRR(i) = diffRR(i) - MRR;
end
doudifMRR = difMRR.^2;
SDNN = mean(doudifMRR);
SDNN = sqrt(SDNN);
%%==============================SDSD=====================================%%
RRdif = mean(difDiffRR);
for i=1:length(difDiffRR)
    difRRdif(i) = difDiffRR(i) - RRdif;
end
doudifRRdif = difRRdif.^2;
SDSD = mean(doudifRRdif);
SDSD = sqrt(SDSD);
%%=============================pNN50=====================================%%
NN50=0;
for i=1:length(difDiffRR)
    if difDiffRR(i) > 50
        NN50 = NN50+1;
    end
end
pNN50=(NN50*100)./length(difDiffRR);
end