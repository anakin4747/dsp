%% README
% This file iterates through all figures using "pause" and "close all"
% to halt on figures and then close them once moving on to the next figure

% After running press any key to move along this list of plots
%   1. Magnitude Spectrum
%   2. Pole-Zero Plot & Magnitude and Phase Response
%   3. ECG and Filtered ECG Waveforms
%   4. ECG Transient Waveform
%   5. Impulse Response

%% Code

clear
close all

% Formatting variables for subplots
plot_height = 2;
plot_width = 1;

ecg_data = load("ecgbn.dat");
% Load in data

fs = 600;
% Sampling Frequency 

stop_time = (length(ecg_data) - 1) / fs;
t = 0:(1 / fs):stop_time;
% X-axis and limits 

fft_ecg = fft(ecg_data);
% FFT

ly = length(fft_ecg);
f = (-ly/2:ly/2-1)/ly*fs;
% X-axis of fft

figure
mag_spec = abs(fftshift(fft_ecg));
plot(f, mag_spec, 60, 149.666, 'o-', 120, 37.9924, 'o-', 180, 74.7737, 'o-', ...
    -60, 149.666, 'o-', -120, 37.9924, 'o-', -180, 74.7737, 'o-');
% Plotting Magnitude Spectrum and Circling Artifacts
title('Magnitude Spectrum of ECG')
ylabel('Magnitude')
xlabel("Frequency (Hz)")

pause
close all

% Zeros
    z1 = cos(2*pi/fs*60) + 1j*sin(2*pi/fs*60);
    z2 = cos(2*pi/fs*60) - 1j*sin(2*pi/fs*60);
    z3 = cos(2*pi/fs*120) + 1j*sin(2*pi/fs*120);
    z4 = cos(2*pi/fs*120) - 1j*sin(2*pi/fs*120);
    z5 = cos(2*pi/fs*180) + 1j*sin(2*pi/fs*180);
    z6 = cos(2*pi/fs*180) - 1j*sin(2*pi/fs*180);

    zeros = [z1 z2 z3 z4 z5 z6]';

% Poles
    r = 0.9;
    p1 = r*cos(2*pi/fs*60) + r*1j*sin(2*pi/fs*60);
    p2 = r*cos(2*pi/fs*60) - r*1j*sin(2*pi/fs*60);
    p3 = r*cos(2*pi/fs*120) + r*1j*sin(2*pi/fs*120);
    p4 = r*cos(2*pi/fs*120) - r*1j*sin(2*pi/fs*120);
    p5 = r*cos(2*pi/fs*180) + r*1j*sin(2*pi/fs*180);
    p6 = r*cos(2*pi/fs*180) - r*1j*sin(2*pi/fs*180);

    poles = [p1 p2 p3 p4 p5 p6]';

% Tranfer Funciton

k = 1;

[numerator, denominator] = zp2tf(zeros, poles, k);

print_tf("ECG Notch Filter", k, numerator, denominator)

figure
zplane(zeros, poles)
pos1 = get(gcf,'Position'); % get position of Figure(1) 
set(gcf,'Position', pos1 - [pos1(3)/2,0,0,0])

figure
freqz(numerator, denominator, 1000, 600)
pos2 = get(gcf,'Position');  % get position of Figure(2) 
set(gcf,'Position', pos2 + [pos1(3)/2,0,0,0])

pause
close all

clean_ecg = filter(numerator, denominator, ecg_data);

figure
subplot(plot_height, plot_width, 1)
plot(t, ecg_data);
title('ECG Waveform')
ylabel('Amplitude')
xlabel('Time (s)')
xlim([0 stop_time])
subplot(plot_height, plot_width, 2)
plot(t, clean_ecg);
title('Filtered ECG Waveform')
ylabel('Amplitude')
xlabel('Time (s)')
xlim([0 stop_time])

pause
close all

figure
plot(t, clean_ecg)
title('Filtered ECG Waveform Transient')
ylabel('Amplitude')
xlabel('Time (s)')
xlim([0 0.5])

pause
close all

[h1, t1] = impz(numerator, denominator);

figure
stem(t1, h1);
title("Impulse Response of Filter")
axis padded
ylabel("Magnitude")
xlabel("Samples")
xlim([0 length(t1)])

pause
close all
