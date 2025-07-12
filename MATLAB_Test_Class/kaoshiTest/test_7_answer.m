n = 0:1:40; % 假设周期为40
x = sin(pi/4 * n) + cos(pi/5 * n);
figure(1);
subplot(3,1,1);
plot(n, x);
xlabel('n');
ylabel('x(n)');
title('Time Domain Waveform of x(n)');
N = 40; % 假设取128点进行FFT
X = fft(x, N);
magnitude = abs(X);
phase = angle(X);
subplot(3,1,2);
stem((0:length(X)-1)/length(X), magnitude);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Discrete Amplitude Spectrum');
subplot(3,1,3);
stem((0:length(X)-1)/length(X), phase);
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
title('Discrete Phase Spectrum');

