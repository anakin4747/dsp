clear;

% Create sinusoidal signal
fs = 8000; % Sampling frequency = 8000 Hz
f = 500; % Signal frequency
A = 1; % Amplitude = 1
numberOfSamples = 300; % 300 samples
t = [0:1/fs:(numberOfSamples-1)*(1/fs)]; % Time from 0 to numberOfSamples at 1/fs
sine = A*sin(2*pi*f*t); % Sinusoidal signal 

% Create white Gaussian noise
whiteNoise = 0.75*randn(1,300);

% Add the sine and noise samples together
sineNoise = sine + whiteNoise;

% Plot noisy sine wave
plot(t,sineNoise);
title('Noisy sine wave');
xlabel('Time (s)');
ylabel('Amplitude');

% Calculate SNR
% SNR = P of signal / P of noise
SNR1 = 20*log10(rms(sine)/rms(whiteNoise))
SNR2 = snr(rms(sine),rms(whiteNoise))

% Compute autocorrelation of noisy sine
[autocorrelationSequence,lagShift] = xcorr(sineNoise);
% Plot autocorrelation of noisy sine
figure, plot(lagShift,autocorrelationSequence);
title('Autocorrelation');
xlabel('Lag');
ylabel('Autocorrelation Sequence');