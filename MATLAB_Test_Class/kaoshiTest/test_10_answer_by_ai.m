% 参数设置
wp = 0.3 * pi; % 通带截止频率（弧度）
ws = 0.4 * pi; % 阻带开始频率（弧度）
deltaw = ws - wp; % 过渡带宽
Rp = 1; % 通带最大波动（dB）
As = 28; % 阻带最小衰减（dB）

% 根据设计公式计算滤波器阶数
delta_p = 10^(-Rp/20); % 通带波动
delta_s = 10^(-As/20); % 阻带衰减
delta = min(delta_p, delta_s); % 选择最小的设计参数
A = -20 * log10(delta); % 衰减参数
N = ceil((A - 8) / (2.285 * deltaw)); % 根据公式计算阶数
N = N + (1 - mod(N, 2)); % 确保阶数为奇数

% 窗函数设计（使用 Hamming 窗）
wc = (wp + ws) / (2 * pi); % 截止频率（归一化）
h = fir1(N, wc, hamming(N+1)); % 设计低通滤波器

% 绘制滤波器单位脉冲响应
figure(15);

% (1) 单位脉冲响应
subplot(4, 1, 1);
stem(0:N, h, 'filled');
xlabel('n');
ylabel('h(n)');
title('单位脉冲响应 h(n)');

% (2) 幅频特性和相频特性
[H, w] = freqz(h, 1, 1000, 'whole'); % 频率响应
H = H(1:501); % 只取 [0, pi] 部分
w = w(1:501) / pi; % 归一化频率轴

% 绘制幅频特性
subplot(4, 1, 2);
plot(w, 20 * log10(abs(H)));
xlabel('归一化频率 (\times\pi rad/sample)');
ylabel('幅度 (dB)');
title('幅频特性');

% 绘制相频特性
subplot(4, 1, 3);
plot(w, angle(H));
xlabel('归一化频率 (\times\pi rad/sample)');
ylabel('相位 (radians)');
title('相频特性');

% (3) 对信号进行滤波
[motherland, fs] = audioread('motherland.wav'); % 读取音频
filtered_signal = filter(h, 1, motherland); % 对音频信号滤波

% 提取 0~1 秒的数据
t = (0:length(filtered_signal)-1) / fs; % 时间轴
filtered_signal_1s = filtered_signal(t <= 1);
t_1s = t(t <= 1);

% 绘制滤波后信号的时域波形
subplot(4, 1, 4);
plot(t_1s, filtered_signal_1s);
xlabel('时间 (s)');
ylabel('幅度');
title('滤波后信号的时域波形 (0~1秒)');
