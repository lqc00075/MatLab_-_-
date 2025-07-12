t = linspace(0, 3, 1000);
x = 10*sin(2*pi*t);
figure(141)
subplot(4,1,1);
plot(t, x);
title('该信号0～3秒的时域连续波形图');
xlabel('Time (s)');
ylabel('Amplitude');
% 采样后的离散波形图
fs = 10;
n = 0:39;
xn = 10*sin(2*pi*n/fs);
subplot(4,1,2);
stem(n/fs, xn);
title('采样后信号前40点的离散波形图');
xlabel('Time (s)');
ylabel('Amplitude');
% 离散幅度频谱和相位频谱图
X = fft(xn, 20);
magX = abs(X);
phaseX = angle(X);
f = (0:19)/20*fs;
subplot(4,1,3);
stem(f, magX);
title('离散幅度频谱');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
subplot(4,1,4);
stem(f, phaseX);
title('相位频谱图');
xlabel('Frequency (Hz)');
ylabel('Phase (rad)');
