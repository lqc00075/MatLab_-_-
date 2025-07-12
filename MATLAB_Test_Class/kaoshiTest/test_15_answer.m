% 设计巴特沃斯滤波器
fs = 2000;
wp = 0.2*pi;
ws = 0.3*pi;
Rp = 1;
Rs = 20;
[n, wc] = buttord(wp, ws, Rp, Rs, 's');
[b, a] = butter(n, wc, 's'); 
% 绘制系统零极图'
figure(151);
subplot(2,2,1);
zplane(b, a);
title('系统零极图');

% 绘制滤波器一个周期的幅频响应和相频响应特性曲线
w = linspace(0, 2*pi, 1000);
[h, f] = freqz(b, a, w);
subplot(2,2,2);
plot(f/2, abs(h));
title('幅频响应特性曲线');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
subplot(2,2,3);
plot(f/2, angle(h));
title('相频响应特性曲线');
xlabel('Frequency (Hz)');
ylabel('Phase (rad)');

% 对信号进行滤波
subplot(2,2,4);
[x, fs] = audioread('motherland.wav');  % 读入音频文件
y = filter(b, a, x);
t = linspace(0, length(x)/fs, length(x));
plot(t, y);
title('滤波后该信号3秒内的连续时域波形图');
xlabel('Time (s)');
ylabel('Amplitude');

