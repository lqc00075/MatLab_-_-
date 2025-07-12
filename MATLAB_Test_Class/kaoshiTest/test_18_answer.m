% 绘制时域波形图
figure(181);

[x, fs] = audioread('motherland.wav');
n = 8000:8399;
x = x(n);
t = (0:length(x)-1)/fs;
subplot(3,1,1);
plot(t, x);
title('时域波形图');
xlabel('Time (s)');
ylabel('Amplitude');

% 计算一个周期的幅度频谱和相位频谱
N = length(x);
X = fft(x);
f = (0:N-1)/N;
w = f;
A = abs(X(1:N));
P = angle(X(1:N));

% 绘制一个周期的幅度频谱和相位频谱图
subplot(3,1,2);
plot(w, A);
title('幅度频谱');
xlabel('Frequency (rad)');
ylabel('Magnitude');
subplot(3,1,3);
plot(w, P);
title('相位频谱图');
xlabel('Frequency (rad)');
ylabel('Phase (rad)');
