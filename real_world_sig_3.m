%% Formatting

clear
close all
plot_height = 2;
plot_width = 1;


%% Seismic Wavefrom

seismic = load("seismic.dat");

fs = 15;
stop_time = (length(seismic) - 1) / fs;
t = 0:1 / fs:stop_time;

% Formatting
subplot(plot_height, plot_width, 1);
plot(t, seismic);
title('Seismic Waveform')
ylabel('Amplitude')
xlabel('Time (s)')
xlim([0 stop_time])


%% Seismic Magnitude Spectrum

fft_seismic = fft(seismic);
% Fast fourier transform

ly = length(fft_seismic);
f = (-ly/2:ly/2-1)/ly*fs;
% Setting up frequencies for x-axis

% Formatting
subplot(plot_height, plot_width, 2);
plot(f, abs(fftshift(fft_seismic)));
% Shift and absolute to get magnitude spectrum
title('Magnitude Spectrum')
ylabel('Magnitude')
xlabel('Frequency (Hz)')

