% clear all;
% files = dir('C:\Users\Harry\Desktop\Sample_ecg\P\record217\*.txt');
% 
% for i = 1:length(files)
%     x  = files(i).folder;
%     t = '\';
%     y  = files(i).name;
%     x = strcat(x,t);
%     x = strcat(x,y);
    fs=360;                                         %tan so lay mau
    ecg=importdata(x);
    [diffRR,mean_RR]=pan_tompkin(ecg,fs,0);
    [MRR,RMSSD,SDSD,SDNN,pNN50] = timeDomain(diffRR);
    [scale] = SD1SD2(SDSD,SDNN);
    [ApEn] = approx_entropy(2,0.2,diffRR);
    [SpEn] = spectral_entropy(diffRR);
    [hflf] = frequencyDomain(diffRR);
    [Alpha,DFA] = DFA_fun(diffRR,length(diffRR),1);

    %% xuat du lieu ra file txt voi 5 dau ra bat ki:
    % [1 0 0 0 0] voi normal
    % [0 1 0 0 0] voi AF
    % [0 0 1 0 0] voi P
    % [0 0 0 1 0] voi BII
    % [0 0 0 0 1] voi ...
%     of=fopen('C:\Users\Harry\Desktop\Sample_ecg\data.txt','a+');
%     fprintf(of,'%3.5f\t%2.5f\t%2.5f\t%2.5f\t%3.5f\t%1.5f\t%2.5f\t%2.5f\t%3.5f\t%3.5f\t0\t0\t1\t0\t0\n',MRR,RMSSD,SDSD,SDNN,pNN50,scale,ApEn,SpEn,hflf,DFA);
%     fclose(of);
% end