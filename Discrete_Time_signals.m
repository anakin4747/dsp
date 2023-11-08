x = [2 5 1 1];
y = [1 8 2 6 8];

n_x = 0:3;
n_y = 0:4;

tiledlayout(2, 2)

nexttile
stem(n_x, x)
title('x')
axis padded

nexttile

stem(n_y, y)
title('y')
axis padded

nexttile

conv_x_y = conv(x, y);
n_conv = 0:length(conv_x_y)-1;

stem(n_conv, conv_x_y)
title('conv')
axis padded

nexttile

xcorr_x_y = xcorr(x, y);
n_xcorr = -length(y)+1:length(x)-1;
xcorr_x_y_8 = 0:length(n_xcorr)-1;
for i = 1:length(n_xcorr)
    xcorr_x_y_8(i) = xcorr_x_y(i);
end

stem(n_xcorr, xcorr_x_y_8)
title('xcorr')
axis padded
