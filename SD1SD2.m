function [scale] = SD1SD2(SDSD,SDNN)
SD1=sqrt((SDSD.^2)/2);
SD2=sqrt((2*(SDNN.^2))-((SDSD.^2)/2));
scale=SD1/SD2;
end