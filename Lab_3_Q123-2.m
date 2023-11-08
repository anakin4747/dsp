% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %                                                        
%   ECE 3331b - Introduction To Signal Processing         %
%   Lab III: Frequency Domain Analysis of Signals         %
%                                                         %
%   March 18 2021, Anakin Childerhose 251018268           %
%   Q1, Q2, Q3                                            %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

     fs = 15;
     Period = 1/fs;
     StartTime = -1;
     StopTime = 1;
     n = (StartTime:Period:StopTime)'; 
     % Defining Signal interval
     
 x = ones(size(n));
 % Creating and populating an array of size n with 1s
 % Defining signal across interval

 sampSigFig = figure('Name','Q1: Discrete Signal x[n]');
 stem(n,x);
 
 % Discrete signal plot of x[n] across n
 % Q1
 
 
 w = -pi:0.01:pi; % frequency interval
 X=0;
 for k = 1:length(w) % iterating across frequency interval
     for n = 1:length(x)  % iterating across signal interval
        X = X + x(n)*exp(-w*1i*n); % fourier equation summed with the previous version of its self
     end
 end
 %Q2
 
fourierSignal = figure('Name','Q2, Q3: DTFT X[w]');
plot(w,abs(X)); % ploting magnitude of X across frequency spectrum
%Q3
 
 