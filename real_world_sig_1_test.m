%% Formatting

clear
close all
plot_height = 2;
plot_width = 1;


%% Male

[m1, fs] = audioread("m1.wav");

stop_time = (length(m1) - 1) / fs;
t = 0:1 / fs:stop_time;

% Formatting
figure
subplot(plot_height, plot_width, 1);
plot(t, m1);
title('Male Waveform')
ylabel('Amplitude')
xlabel('Time (s)')
xlim([0 stop_time])
pos1 = get(gcf,'Position'); % get position of Figure(1) 
set(gcf,'Position', pos1 - [pos1(3)/2,0,0,0])
% Shift first figure left

fft_m1 = fft(m1);
% Fast fourier transform

ly = length(fft_m1);
f = (-ly/2:ly/2-1)/ly*fs;
% Frequency range for fft

subplot(plot_height, plot_width, 2);
plot(f, abs(fftshift(fft_m1)));
% Shifted and absoluted to get magnitude spectrum
title('Male Magnitude Spectrum')
ylabel('Magnitude')
xlabel('Frequency (Hz)')


%% Female

[f1, fs] = audioread("f1.wav");

stop_time = (length(f1) - 1) / fs;
t = 0:1 / fs:stop_time;

% Formatting
figure;
subplot(plot_height, plot_width, 1);
plot(t, f1);
title('Female Waveform')
ylabel('Amplitude')
xlabel('Time (s)')
xlim([0 stop_time])
pos2 = get(gcf,'Position');  % get position of Figure(2) 
set(gcf,'Position', pos2 + [pos1(3)/2,0,0,0])
% shift second figure right

fft_f1 = fft(f1);
% Fast fourier transform

ly = length(fft_f1);
f = (-ly/2:ly/2-1)/ly*fs;
% Frequency range for fft

subplot(plot_height, plot_width, 2);
plot(f, abs(fftshift(fft_f1)));
title('Female Magnitude Spectrum')
ylabel('Magnitude')
xlabel('Frequency (Hz)')


%% Sounds of Waveforms

% pause
% fprintf("Male\n");
% sound(m1, fs)
% pause(1.5)
% fprintf("Female\n");
% sound(f1, fs)




