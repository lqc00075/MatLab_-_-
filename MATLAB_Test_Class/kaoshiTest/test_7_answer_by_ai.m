% 定义序列 x(n)
N = 40; % 定义周期长度
n = 0:N-1; % 一个周期的 n 取值
x = sin(pi/4 * n) + cos(pi/5 * n); % 序列公式

% 创建图形窗口
figure(5);

%% 1. 绘制一个周期的时域波形
subplot(3, 1, 1);
stem(n, x, 'filled'); % 用 stem 表示离散序列
title('一个周期的时域波形');
xlabel('n'); ylabel('x(n)');

%% 2. 谱分析
% 计算频谱（取 N 点）
X = fft(x, N); % N 点离散傅里叶变换
amplitude = abs(X); % 幅度谱
phase = angle(X); % 相位谱
freq = (0:N-1) / N; % 归一化频率 (0 到 1)

% 绘制幅度谱
subplot(3, 1, 2);
stem(freq, amplitude, 'filled');
title('幅度谱');
xlabel('归一化频率 (×2π rad/sample)'); ylabel('幅度');

% 绘制相位谱
subplot(3, 1, 3);
stem(freq, phase, 'filled');
title('相位谱');
xlabel('归一化频率 (×2π rad/sample)'); ylabel('相位 (rad)');

%% 调整布局
sgtitle('序列 x(n) 的时域波形与频谱分析');
