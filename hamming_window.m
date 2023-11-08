frequencies=1000:1000:7000;
% A vector of frequencies ranging from 1kHz to 7kHz incrementing by 1kHz

fs=8000;
% creating a variable for sampling frequency of 8kHz
T=0:1/fs:2;
% A vector of time starting at zero
% incrementing by the sampling period
% until 2 seconds

figure;
% Opens a blank window where the graph will be plotted

for fi=frequencies
    % A for loop the iterates through the vector frequencies
    % with an index of fi
    x = 0.25*sin(2*pi*fi*T);
    % Signal x which is a vector

    myspectrogram(x, fs/10, fs, hamming(fs/10), fs/20);
    % calls myspectrogram() function defined in the myspectrogram.m file
    ttl = sprintf('Freq = %4.0f Hz\n', fi);
    % I added this to tell which freq is plotted at the time
	title(ttl)
    pause
    % wait for user to press any key to continue
end
% end of for loop

function winHamming = hamming(N)
    % creating a function called hamming(N)
    % which returns an output called winHamming
    
    winHamming = 0.54 - 0.46*cos(2*pi*(0:N-1)/N);
    % equation to generate a hamming window
    % it is a vector of values ranging 
    % from n = 0 to n = N - 1

end
