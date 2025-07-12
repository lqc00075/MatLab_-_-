% 调用 xtg 函数生成加噪声信号
[xt, t] = xtg(1000); % 采样频率为 1000 Hz

% 计算频谱
N = length(xt); % 信号长度
fs = 1000; % 采样频率
X = fft(xt); % 快速傅里叶变换
X_mag = abs(X)/N; % 幅度归一化
f = (0:N-1)*(fs/N); % 频率轴

% 绘制结果
figure(15);

% (1) 加噪声信号的时域波形
subplot(3, 1, 1);
plot(t, xt);
title('信号加噪声波形');
xlabel('t/s');
ylabel('x(t)');
xlim([0 0.2]); % 修改横坐标范围
grid on;

% (2) 信号加噪声的频谱
subplot(3, 1, 2);
plot(f, X_mag);
title('信号加噪声的频谱');
xlabel('f/Hz');
ylabel('幅度');
xlim([0 fs/2]);
grid on;

% (3) 信号加噪声的频谱 (50-150 Hz)
subplot(313);
plot(f, X_mag);
title('信号加噪声的频谱 (50-150 Hz)');
xlabel('f/Hz');
ylabel('幅度');
xlim([50 150]); % 修改横坐标范围为 50-150
xticks(50:10:150); % 设置刻度间隔为 10
grid on;
