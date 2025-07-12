% 已知序列定义
n = 0:23; % 一个周期内的采样点
x = sin(pi/4 * n) + cos(pi/6 * n); % 定义序列

% (1) 绘制序列一个周期的时域波形图
figure;

subplot(2, 2, 1);
stem(n, x, 'filled');
title('时域波形：x(n)');
xlabel('n');
ylabel('Amplitude');

% (2) 对序列进行频谱分析
N = 24; % 取周期序列 N 点进行频谱分析
X = fft(x, N); % 计算 N 点 FFT
freq = (0:N-1) * 2 * pi / N; % 频率刻度

% 幅度谱
subplot(2, 2, 2);
stem(freq, abs(X), 'filled');
title('幅度谱：|X(k)|');
xlabel('\omega (rad/s)');
ylabel('Magnitude');

% 相位谱
subplot(2, 2, 3);
stem(freq, angle(X), 'filled');
title('相位谱：\angle X(k)');
xlabel('\omega (rad/s)');
ylabel('Phase (rad)');

% 重新绘制周期时域波形 (更清晰)
subplot(2, 2, 4);
plot(n, x, '-o');
title('时域波形：x(n) (平滑展示)');
xlabel('n');
ylabel('Amplitude');

% 设置整体标题
sgtitle('已知序列时域与频域分析');
