
n = 0:23;
xn = sin(pi/4*n) + cos(pi/6*n);
figure(22);
subplot(311);
stem(0:length(xn)-1,xn);

X=fft(xn,24);
subplot(312);
stem((0:length(X)-1)*2*pi/length(X),abs(X));
subplot(313);
stem((0:length(X)-1)*2*pi/length(X),angle(X));