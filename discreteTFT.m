clear 
close all

%% Plot 1

% Gain
    k1 = 1;

% Zeros
    z1_1 = 0.7 + 1j*1.4*sin(pi/3);
    z2_1 = 0.7 - 1j*1.4*sin(pi/3);
    % Complex Conjugate 1.4e^(+/-j*pi/3)

    z3_1 = -0.6 + 1j*1.2*sin(2*pi/3);
    z4_1 = -0.6 - 1j*1.2*sin(2*pi/3);
    % Complex Conjugate 1.2e^(+/-j*2*pi/3)

    zeros_plot1 = [z1_1 z2_1 z3_1 z4_1]';
    % Column of zeros
   
% Poles
    p1_1 = 0;
    p2_1 = 0;
    % Two Poles at the origin

    p3_1 = 0.7*cos(pi/6) + 1j*0.7*sin(pi/6);
    p4_1 = 0.7*cos(pi/6) - 1j*0.7*sin(pi/6);
    % Complex Conjugate 0.7e^(+/-j*pi/6)

    poles_plot1 = [p1_1 p2_1 p3_1 p4_1]';
    % Column of poles

[xpanded_zeros_1, xpanded_poles_1] = zp2tf(zeros_plot1, poles_plot1, k1);

[h1, t1] = impz(xpanded_zeros_1, xpanded_poles_1);

figure
stem(t1, h1);
title("Impulse Response of Plot 1")
axis padded
ylabel("Magnitude")
xlabel("Samples")
xlim([0 length(t1)])

fprintf("Hit enter to go to plot 2\n\n")
pause

close all

%% Plot 2

% Gain
    k2 = 1;

% Zeros
    z1_2 = 1;
    z2_2 = -1;
    % Zeros at 1 and -1

    zeros_plot2 = [z1_2 z2_2]';
    % Column of zeros
   
% Poles
    p1_2 = cos(pi/4) + 1j*sin(pi/4);
    p2_2 = cos(pi/4) - 1j*sin(pi/4);
    % Complex Conjugate e^(+/-j*pi/4)

    poles_plot2 = [p1_2 p2_2]';
    % Column of poles

[xpanded_zeros_2, xpanded_poles_2] = zp2tf(zeros_plot2, poles_plot2, k2);
[h2, t2] = impz(xpanded_zeros_2, xpanded_poles_2);

figure
stem(t2, h2);
title("Impulse Response of Plot 2")
axis padded
ylabel("Magnitude")
xlabel("Samples")
xlim([0 length(t2)])

fprintf("Hit enter to go to plot 3\n\n")
pause

close all

%% Plot 3

% Gain
    k3 = 1;

% Zeros
    z1_3 = 0;
    z2_3 = 0;
    % Two zeros at the origin

    zeros_plot3 = [z1_3 z2_3]';
    % Column of zeros
   
% Poles
    p1_3 = 1;
    p2_3 = 1;
    % Two Poles at 1

    poles_plot3 = [p1_3 p2_3]';
    % Column of poles

[xpanded_zeros_3, xpanded_poles_3] = zp2tf(zeros_plot3, poles_plot3, k3);
[h3, t3] = impz(xpanded_zeros_3, xpanded_poles_3);

figure
stem(t3, h3);
title("Impulse Response of Plot 3")
axis padded
ylabel("Magnitude")
xlabel("Samples")
xlim([0 length(t3)])

pause
close all
