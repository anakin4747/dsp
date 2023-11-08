r = 0.3;
fs = 400;

%2 Pole 2 Zero low pass filter
b0 = (2-(1.5*r)+r^2)/3.721;
numL = [(1*b0) (1.721*b0) (1*b0)];
denL = [1 (-1.5*r) r^2];
fvtool(numL,denL);

b1 = 0.103;
numH = [1*b1 -1.176*b1 1*b1];
denH = [1 1.033 0.36];

fvtool(numH,denH);

r1 = 0.9;
b2 = ((r1^2 + 0.219*r1 +1)/2.219);
numN = [(1*b2) (-0.219*b2) (1*b2)];
denN = [1 (-0.219*r1) (r1^2)];
 
fvtool(numN,denN);
