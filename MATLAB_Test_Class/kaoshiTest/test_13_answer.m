num = [1, 0, 0, 0, 0, 0, 0, 0, -1];
den = [1, 0, 0, 0, 0, 0, 0, 0, -0.9];
figure(5)
zplane(num, den);
% 幅频特性和相频特性曲线
w = 0:0.01:2*pi;
h = freqz(num, den, w);
mag = abs(h);
phase = angle(h);
subplot(3, 1, 1);
plot(w, mag);
title('幅频特性曲线');
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');
subplot(3, 1, 2);
plot(w, phase);
title('相频特性曲线');
xlabel('Frequency (rad/sample)');
ylabel('Phase (rad)');
% 对motherland.wav进行滤波并绘制时域波形图
subplot(3,1,3);
[xn,fs] = audioread('motherland.wav');
y = filter(num, den, xn);
t = linspace(0, 3, length(y));
plot(t, y);
title('滤波后该信号3秒内的连续时域波形图');
xlabel('Time (s)');
ylabel('Amplitude');
