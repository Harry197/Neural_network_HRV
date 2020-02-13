function [SpEn] = spectral_entropy(ecg)
ecg_fft = fft(ecg);
ecg_psd = abs(ecg_fft).^2;
k=sum(ecg_psd);
for i=1:length(ecg_psd)
    p(i)=ecg_psd(i)./k;
end
for i=1:length(p)
    H(i)=-p(i)*log(p(i));
end
SpEn=sum(H);
end