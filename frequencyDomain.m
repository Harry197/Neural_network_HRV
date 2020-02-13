function [hflf] = frequencyDomain(diffRR)
lf=0;
hf=0;
ecg_fft=fft(diffRR);
img=imag(ecg_fft);
rea=real(ecg_fft);
for i=1:length(ecg_fft)
    w(i)=atan(img(i)./rea(i));
    if(w(i)<0)
        f(i)=(w(i)+pi)./(2*pi);
    else
        f(i)=w(i)./(2*pi);
    end
end
ecg_psd=abs(ecg_fft).^2;
for i=1:length(diffRR)
    if f(i)>0.04 & f(i)<0.15
        lf=lf+ecg_psd(i);
    end
    if f(i)>0.15 & f(i)<0.4
        hf=hf+ecg_psd(i);
    end
end
hflf=hf./lf;
end