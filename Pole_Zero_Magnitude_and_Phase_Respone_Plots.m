%% README
% This file iterates through all figures using "pause" and "close all"
% to halt on figures and then close them once moving on to the next figure

% After running press any key to move along this list of plots
%   1. Pole-Zero Plot and Impulse Response
%   2. Magnitude and Phase plots 


%% Code

clear
close all

numerator = 1;
denomenator = [1 0.1929 0.9861 -0.2393 0.4408 -0.1956 0.1139];
% Both are row vectors
root = roots(denomenator);

poles_str = "\nPoles:\n";
for x = 1:length(root)
% Converting to Polar coordinates of Poles
    [num, den] = rat(round(angle(root(x))/pi, 3));
    str = sprintf("\t%ge^j(%dpi/%d)\n", round(abs(root(x)), 2), num, den);
    poles_str = strcat(poles_str, str);
end
fprintf(strcat(poles_str, "\n"));


figure
zplane(numerator, denomenator);
pos1 = get(gcf,'Position'); % get position of Figure(1) 
set(gcf,'Position', pos1 - [pos1(3)/2,0,0,0])

[h1, t1] = impz(numerator, denomenator);
figure
stem(t1, h1);
title("Impulse Response of Digital Filter")
axis padded
ylabel("Magnitude")
xlabel("Samples")
xlim([0 length(t1)])
pos2 = get(gcf,'Position');  % get position of Figure(2) 
set(gcf,'Position', pos2 + [pos1(3)/2,0,0,0])

print_tf("Digital Filter", 1, numerator, denomenator)

fprintf("\nHit enter to display Magnitude and Frequency Response\n\n")
pause
close all

figure
freqz(numerator, denomenator)

pause
close all
