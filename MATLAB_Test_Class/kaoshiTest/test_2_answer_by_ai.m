% 定义 n 和 x(n)
n1 = 0:47; % x1(n)
n2 = 0:95; % x2(n)

% 定义序列 x1(n) 和 x2(n)
x1 = cos(pi/4 * n1) + cos(pi/8 * n1) + cos(pi/12 * n1) + cos(pi/24 * n1);
x2 = cos(pi/4 * n2) + cos(pi/8 * n2) + cos(pi/12 * n2) + cos(pi/24 * n2);

% 计算 DFT
X1_48 = fft(x1, 48);
X2_96 = fft(x2, 96);

% 计算幅度谱和相位谱
amp_X1_48 = abs(X1_48);
phase_X1_48 = angle(X1_48);

amp_X2_96 = abs(X2_96);
phase_X2_96 = angle(X2_96);

% 创建图形窗口
figure;

% 绘制 x1(n) 和 x2(n) 的波形图 (使用 stem 表示离散序列)
subplot(3, 2, 1);
stem(n1, x1, 'b', 'filled');
title('x_1(n) 波形');
xlabel('n'); ylabel('Amplitude');

subplot(3, 2, 2);
stem(n2, x2, 'r', 'filled');
title('x_2(n) 波形');
xlabel('n'); ylabel('Amplitude');

% 绘制 x1(n) 的幅度谱和相位谱
subplot(3, 2, 3);
stem(0:48-1, amp_X1_48, 'b', 'filled');
title('x_1(n) 幅度谱');
xlabel('Frequency Index'); ylabel('Amplitude');

subplot(3, 2, 4);
stem(0:48-1, phase_X1_48, 'b', 'filled');
title('x_1(n) 相位谱');
xlabel('Frequency Index'); ylabel('Phase (rad)');

% 绘制 x2(n) 的幅度谱和相位谱
subplot(3, 2, 5);
stem(0:96-1, amp_X2_96, 'r', 'filled');
title('x_2(n) 幅度谱');
xlabel('Frequency Index'); ylabel('Amplitude');

subplot(3, 2, 6);
stem(0:96-1, phase_X2_96, 'r', 'filled');
title('x_2(n) 相位谱');
xlabel('Frequency Index'); ylabel('Phase (rad)');

% 调整布局
sgtitle('离散序列波形与频谱分析');
