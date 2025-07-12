% 连续时间信号
t = 0:0.01:2; % 时间从0到2秒，步长为0.01
xt = cos(4 * pi * t) + sin(8 * pi * t); % 定义连续信号

% 绘制
figure(5);

% 第一题：0~2秒连续时域波形
subplot(4, 1, 1);
plot(t, xt);
xlabel('时间 (s)');
ylabel('幅度');
title('连续信号 x(t) 的时域波形');

% 第二题：满足采样定理的采样
fs = 32; % 采样频率，满足 Nyquist 条件
T = 1 / fs; % 采样周期
n = 0:2 * 32 - 1; % 采样点，取两个周期
xn = cos(4 * pi * n * T) + sin(8 * pi * n * T); % 离散信号

% 绘制离散信号
subplot(4, 1, 2);
stem(n, xn, 'filled');
xlabel('采样点 n');
ylabel('幅度');
title('采样信号 x[n] 的时域波形');

% 第三题：离散信号的离散幅度谱
N = 16; % FFT 点数
Xk = fft(xn, N); % 计算 FFT
freq = (0:N-1) * fs / N; % 频率轴

% 绘制幅度谱
subplot(4, 1, 3);
stem(freq, abs(Xk), 'filled');
xlabel('频率 (Hz)');
ylabel('幅度');
title('采样信号的幅度谱');

% 绘制相位谱
subplot(4, 1, 4);
stem(freq, angle(Xk), 'filled');
xlabel('频率 (Hz)');
ylabel('相位 (radian)');
title('采样信号的相位谱');
