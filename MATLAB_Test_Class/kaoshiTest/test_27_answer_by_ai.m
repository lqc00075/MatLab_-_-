% 读取音频文件
[audio, fs] = audioread('motherland.wav'); % 读取母音频信号
D = 3; % 整数倍抽取因子

% (1) 设计满足要求的抗混叠 IIR 滤波器
Wp = 1 / D; % 归一化通带截止频率（抗混叠）
Ws = 1.2 * Wp; % 归一化阻带截止频率
Rp = 1; % 通带波动 (dB)
Rs = 40; % 阻带衰减 (dB)
[n, Wn] = buttord(Wp, Ws, Rp, Rs); % 设计巴特沃斯滤波器参数
[b, a] = butter(n, Wn); % 巴特沃斯滤波器系数

% 绘制滤波器幅频响应和相频响应
[H, f] = freqz(b, a, 512, fs); % 频率响应
figure;
subplot(3, 2, 1);
plot(f, abs(H));
title('滤波器幅频响应');
xlabel('频率 (Hz)');
ylabel('幅度');

subplot(3, 2, 2);
plot(f, angle(H));
title('滤波器相频响应');
xlabel('频率 (Hz)');
ylabel('相位 (rad)');

% (2) 滤波 + 整数倍抽取
audio_filtered = filter(b, a, audio); % 滤波
xn1 = audio_filtered(1:D:end); % 3 倍抽取

% 提取抽取后的信号指定段落
n_start = 8000; % 起始点
n_end = 8100; % 结束点
segment = xn1(n_start:n_end);

% 频谱分析
N = length(segment);
segment_fft = fft(segment, N);
freq = (0:N-1) * (fs / D) / N; % 频率坐标

% 绘制抽取信号时域波形和频谱
subplot(3, 2, 3);
plot(xn1);
title('抽取后音频信号 (时域)');
xlabel('采样点');
ylabel('幅度');

subplot(3, 2, 4);
plot(freq, abs(segment_fft));
title('抽取信号幅度频谱');
xlabel('频率 (Hz)');
ylabel('幅度');

subplot(3, 2, 5);
plot(freq, angle(segment_fft));
title('抽取信号相位频谱');
xlabel('频率 (Hz)');
ylabel('相位');

% 整体标题
sgtitle('IIR 滤波器设计与抽取信号分析');
