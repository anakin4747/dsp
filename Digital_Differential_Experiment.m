% load('quakedata.mat')

plot_height = 3;
plot_width = 1;

fc = 100;
% Cutoff frequency
width = 50;
% Transition Width
A_kais = 55;
% Attenuation for Kaiser Window
w_c = 2*pi*fc / fs;
% Cutoff Angular Frequency
delta = (A_kais - 7.95) / 14.36;
% Delta
N = round(delta * fs / width + 1);
% Filter Length
M = (N - 1) / 2;
% Midpoint of Filter Length
beta = 0.1102 * (A_kais - 8.7);
% beta of Kaiser Window

n = 0:N - 1;

h_LPDD = (w_c * cos(w_c * (n - M)) ./ (pi * (n - M)))...
             - (sin(w_c * (n - M)) ./ (pi * (n - M) .^ 2));
% Generates LPDD Impulse Response

h_LPDD(M + 1) = 0;
% Set Midpoint to Zero

win = kaiser(N, beta);
% Generate Kaiser Window

h_w_LPDD = h_LPDD .* win';
% Apply Window to Impulse Response

% fvtool(h_w_LPDD, 'Fs', fs)

subplot(plot_height, plot_width, 1)
plot(drift_data)
xlim([1 (length(drift_data) + 1)])
title('Drift Data')
xlabel('time, s')
ylabel('meters, m')
% Drift Data Plot

subplot(plot_height, plot_width, 2)
vel = filter(h_w_LPDD, 1, drift_data);
plot(vel)
xlim([1 (length(vel) + 1)])
title('Velocity')
xlabel('time, s')
ylabel('velocity, m/s')
% Velocity

subplot(plot_height, plot_width, 3)
acc = filter(h_w_LPDD, 1, vel);
plot(acc)
xlim([1 (length(acc) + 1)])
title('Acceleration')
xlabel('time, s')
ylabel('acceleration, m/s^2')
% Acceleration

% Part 5
w_c = pi;
h_LPDD = (w_c * cos(w_c * (n - M)) ./ (pi * (n - M)))...
             - (sin(w_c * (n - M)) ./ (pi * (n - M) .^ 2));
% Generates LPDD Impulse Response

h_LPDD(M + 1) = 0;
% Set Midpoint to Zero

win = kaiser(N, beta);
% Generate Kaiser Window

h_w_LPDD = h_LPDD .* win';
% Apply Window to Impulse Response

figure
subplot(2, plot_width, 1)
acc = filter(h_w_LPDD, 1, vel);
plot(acc)
xlim([1 (length(acc) + 1)])
title('Acceleration (Full Band)')
xlabel('time, s')
ylabel('acceleration, m/s^2')

subplot(2, plot_width, 2)
plot(diff(diff(drift_data)))
xlim([1 (length(diff(diff(drift_data))) + 1)])
title('Acceleration (First Order)')
xlabel('time, s')
ylabel('acceleration, m/s^2')

