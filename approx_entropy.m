function [apen] = approx_entropy(n,r,a)


%% Code for computing approximate entropy for a time series: Approximate
% Entropy is a measure of complexity. It quantifies the unpredictability of
% fluctuations in a time series

% To run this function- type: approx_entropy('window length','similarity measure','data set')

% i.e  approx_entropy(5,0.5,a)

% window length= length of the window, which should be considered in each iteration
% similarity measure = measure of distance between the elements
% data set = data vector

% small values of apen (approx entropy) means data is predictable, whereas
% higher values mean that data is unpredictable

% concept boorowed from http://www.physionet.org/physiotools/ApEn/

% Author: Avinash Parnandi, parnandi@usc.edu, http://robotics.usc.edu/~parnandi/
%%


data =a;


for m=n:n+1; % run it twice, with window size differing by 1

set = 0;
count = 0;
counter = 0;
window_correlation = zeros(1,(length(data)-m+1));

for i=1:(length(data))-m+1,
    current_window = data(i:i+m-1); % current window stores the sequence to be compared with other sequences
    
    for j=1:length(data)-m+1,
    sliding_window = data(j:j+m-1); % get a window for comparision with the current_window
    
    % compare two windows, element by element
    % can also use some kind of norm measure; that will perform better
    for k=1:m,
        if((abs(current_window(k)-sliding_window(k))>r) && set == 0)
            set = 1; % i.e. the difference between the two sequence is greater than the given value
        end
    end
    if(set==0) 
         count = count+1; % this measures how many sliding_windows are similar to the current_window
    end
    set = 0; % reseting 'set'
    
    end
   counter(i)=count/(length(data)-m+1); % we need the number of similar windows for every cuurent_window
   count=0;
i;
end  %  for i=1:(length(data))-m+1, ends here


counter;  % this tells how many similar windows are present for each window of length m
%total_similar_windows = sum(counter);

%window_correlation = counter/(length(data)-m+1);
correlation(m-n+1) = ((sum(counter))/(length(data)-m+1));


 end % for m=n:n+1; % run it twice   
   correlation(1);
   correlation(2);
apen = log(correlation(1)/correlation(2));
end
    

