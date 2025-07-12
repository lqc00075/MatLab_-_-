fs = 1000;
wp = 0.2*pi; 
ws = 0.3*pi; 
Rp = 1;  
Rs = 30;
[n, wc] = buttord(wp, ws, Rp, Rs, 's');
[b, a] = butter(n, wc, 's');  
w = linspace(0, pi, 500);
[h, f] = freqz(b, a);
figure;
subplot(3,1,1);
plot(f, abs(h));
title('幅频响应特性曲线');
xlabel('Frequency (Hz)');
ylabel('Phase (rad)');
subplot(3,1,2);
plot(f*fs/(2*pi), angle(h));
title('相频响应特性曲线');
xlabel('Frequency (Hz)');
ylabel('Phase (rad)');

% 对信号进行滤波并绘制幅度频谱图
[x, fs] = audioread('motherland.wav');
y = filter(b, a, x);
n = 8000:8199; 
Y = fft(y(n)); 
f = (0:length(n)-1)*fs/length(n); 
subplot(3,1,3)
plot(f, abs(Y));
title('模拟域幅度频谱图');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
