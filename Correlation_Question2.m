clear;

% Read in audio files
[dataM,sampleRateM] = audioread('m1.wav');
[dataF,sampleRateF] = audioread('f1.wav');

% Compute auto correlation of each
[autoCorrelationM,lagM] = xcorr(dataM);
[autoCorrelationF,lagF] = xcorr(dataF);

% Plot each auto correlation
plot(lagM,autoCorrelationM);
title('Male Autocorrelation');
xlabel('Lag');
ylabel('Autocorrelation');
figure, plot(lagF,autoCorrelationF);
title('Female Autocorrelation');
xlabel('Lag');
ylabel('Autocorrelation');
