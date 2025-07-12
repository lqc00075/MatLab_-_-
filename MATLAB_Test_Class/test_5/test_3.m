% 读取音频文件
[xn, fs] = audioread('motherland.wav');

% 截取第 1000 到 2999 共 2000 个采样点
x_segment = xn(1000:2999);

% 参数设置
N = 2000;  % 原始数据点数
N_downsampled = 1000;  % 抽取后的数据点数

% (1) 分析 2000 采样点的幅度频谱
X_2000 = fft(x_segment, N);     % 对 2000 点数据进行 FFT
f_2000 = (0:N-1) * (fs / N);    % 频率轴
M_2000 = abs(X_2000);           % 幅度谱

% 绘制 2000 采样点的幅度频谱
figure(3);
subplot(2, 1, 1);
plot(f_2000, M_2000);
title('2000 采样点的频谱幅度');
xlabel('频率 (Hz)');
ylabel('幅度');
grid on;

% (2) 对 2000 个采样点数据每 2 个点抽取 1 点，得到 1000 点数据
x_downsampled = x_segment(1:2:end);

% 对抽取后的 1000 点数据进行 FFT
X_1000 = fft(x_downsampled, N_downsampled);
f_1000 = (0:N_downsampled-1) * (fs / 2 / N_downsampled); % 新的频率轴（采样频率减半）
M_1000 = abs(X_1000);            % 幅度谱

% 绘制抽取后 1000 采样点的幅度频谱
subplot(2, 1, 2);
plot(f_1000, M_1000);
title('抽取后 1000 采样点的频谱幅度');
xlabel('频率 (Hz)');
ylabel('幅度');
grid on;
