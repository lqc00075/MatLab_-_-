[x, fs] = audioread('motherland.wav');
h = [1 1 1 1 1];
y = conv(x, h, 'same');

% 绘制滤波前和滤波后的时域波形图
t = (0:length(x)-1)/fs;
figure;
subplot(3,1,1);
plot(t, x);
title('滤波前音频信号的时域波形图');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(2, 1, 2);
plot(t, y);
title('滤波后音频信号的时域波形图');
xlabel('Time (s)');
ylabel('Amplitude');

% 取序号为[16000, 16199]之间的序列值进行频谱分析
n = 16000:16199;
x = x(n);
y = y(n);
N = length(x);
X = fft(x);
Y = fft(y);
f = (0:N-1)*fs/N;
w = 2*pi*f;
A_x = abs(X)/N;
P_x = angle(X);
A_y = abs(Y)/N;
P_y = angle(Y);

% 绘制幅度频谱和相位频谱图
subplot(3,1,2);
plot(w, A_x, 'b-', w, A_y, 'r--');
title('幅度频谱');
xlabel('Frequency (rad)');
ylabel('Magnitude');
legend('Original Signal', 'Filtered Signal');
subplot(3,1,3);
plot(w, P_x, 'b-', w, P_y, 'r--');
title('相位频谱图');
xlabel('Frequency (rad)');
ylabel('Phase (rad)');
legend('Original Signal', 'Filtered Signal');