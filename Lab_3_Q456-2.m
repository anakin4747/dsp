% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %                                                        
%   ECE 3331b - Introduction To Signal Processing         %
%   Lab III: Frequency Domain Analysis of Signals         %
%                                                         %
%   March 18 2021, Anakin Childerhose 251018268           %
%   Q4, Q5, Q6                                            %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %


    %Defining Signal Properties   
         fsTest = 20; %test singal sampling frequency
         pTest = 1/fsTest;% sampling period
         n = (0:pTest:1)'; %vector column' from 0 to 1 by increments of the sampling period
         f = 2; %calculated frequency
                 %sin(pin/5) = sin(2pi(f/fs)n)
                 %pin/5 = 2pi(f/fs)n
                 %1/5 = 2(f/fs)     fs = 20 Hz
                 %1/5 = f/10
                 %f = 2
         
 testSignal = (sin(2*pi*f*n)); %sine wave with those^ properties

    for n = 1:length(testSignal) % loop sets the signal equal to 0 for values n = 10-20
         if n>10
             testSignal(n) = 0;
         end
    end
    
 outputSignal = discTFT(testSignal,0.01); % calling and saving the DTFT function
                                           % passing test signal and
                                            % resolution
                                             % Q5

                                          
 f = -10:0.1/pi:10; % since resolution is a local variable it is not saved I have to make a new vector row
                  % using the same frequency resolution
                  % in hertz
                  
 fourTestSignal = figure('Name','Q6: DTFT Signal Xtest[w]');  %setting this figure to be used next            
 plot(f,abs(outputSignal)); % plotting dsicrete fourier transformed signal across frequency resolution/sprectrum
                             % Q6
 
 function [Xn] = discTFT(signal,resolution) % discrete transfer function that performs a 
                                             % fourier transform with a given signal and frequency
                                              % resolution returns a output signal X(w)
                                               % Q4
    Xn = 0; % initilze
    
    freqSpect = -pi:resolution:pi; % creating frequency spectrum w e [-pi,pi] in rad
                                   % incremented py passed resolution value
                                   
        for k = 1:length(freqSpect)  % iterating across the frequency spectrum
             for n = 1:length(signal) % for loop provides way to provide 
               Xn = Xn + signal(n)*exp(-freqSpect*1i*n); % iterating summation for values of n then k

             end
        end
 end
 