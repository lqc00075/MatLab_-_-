wp = 0.1 * pi; % 通带截止频率
ws = 0.2 * pi; % 阻带截止频率
Rp = 1; % 通带最大允许波纹 (dB)
Rs = 45; % 阻带最小衰减 (dB)

% 设计滤波器
dev = [(10^(Rp/20)-1)/(10^(Rp/20)+1), 10^(-Rs/20)];
[N, Wn, beta, ftype] = kaiserord([wp/(2*pi), ws/(2*pi)], [1, 0], dev);
b = fir1(N, Wn, ftype, kaiser(N+1, beta), 'noscale');

% (1) 求单位脉冲响应h(n)和绘制频域特性
figure;

subplot(3, 1, 1);
stem(0:N, b);
title('单位脉冲响应 h(n)');
xlabel('n');
ylabel('h(n)');

subplot(3, 1, 2);
freqz(b, 1, 1024, 'half', 44100); % 1024点FFT，采样率为44100Hz
title('系统频域的幅频特性和幅度衰减特性');

subplot(3, 1, 3);
grpdelay(b, 1, 1024, 44100); % 组延迟
title('系统相频特性');

% (2) 对motherland.wav进行滤波
[x, fs] = audioread('motherland.wav'); % 读取音频文件
y = filter(b, 1, x); % 使用设计的滤波器进行滤波

figure;
t = 0:1/fs:(length(x)-1)/fs; % 时间向量

subplot(2, 1, 1);
plot(t, x);
title('原始音频信号时域波形');
xlabel('时间 (s)');
ylabel('幅度');

subplot(2, 1, 2);
plot(t, y);
title('滤波后音频信号时域波形');
xlabel('时间 (s)');
ylabel('幅度');

sgtitle('音频信号滤波效果');
