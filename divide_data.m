% clear all;
% x='C:\Users\Harry\Desktop\P\record104\record104_536400.txt';
% data=importdata(x);
% a=1;
% for i=1:(360*5):(length(data)-10800)
%     b=num2str(a);
%     y='C:\Users\Harry\Desktop\Sample_ecg\P\record104';
%     z=strcat(y,'\record104_536400_');
%     y=strcat(z,b);
%     z=strcat(y,'.txt');
%     of=fopen(z,'a+');
%     for j=i:(i+10800-1)
%         e=data(j);
%         fprintf(of,'%.4f\n',e);
%     end
%     fclose(of);
%     a=a+1;
% end 