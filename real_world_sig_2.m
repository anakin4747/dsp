%% Formatting

clear
close all
plot_height = 2;
plot_width = 1;


%% ECG Wavefrom

ecg = load("ecg.dat");

fs = 500;
stop_time = (length(ecg) - 1) / fs;
t = 0:1 / fs:stop_time;

% Formatting
subplot(plot_height, plot_width, 1);
plot(t, ecg);
title('ECG Waveform')
ylabel('Amplitude')
xlabel('Time (s)')
xlim([0 stop_time])


%% ECG Magnitude Spectrum

fft_ecg = fft(ecg);
% Fast fourier transform

ly = length(fft_ecg);
f = (-ly/2:ly/2-1)/ly*fs;
% Setting up frequencies for x-axis

% Formatting
subplot(plot_height, plot_width, 2);
plot(f, abs(fftshift(fft_ecg)));
% Shift and absolute to get magnitude spectrum
title('Magnitude Spectrum')
ylabel('Magnitude')
xlabel('Frequency (Hz)')

figure
plot(f, abs(fftshift(fft_ecg)));
title('Magnitude Spectrum (-100Hz to 100Hz)')
ylabel('Magnitude')
xlabel('Frequency (Hz)')
xlim([-100 100])

