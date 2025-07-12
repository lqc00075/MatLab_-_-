% 信号设置
N = 20; % 信号长度
n = 0:N-1;
x =[1,1,1,1,1,1,1,1,1,1,...
    1,1,1,1,1,1,1,1,1,1]; % 示例信号，可替换为 R20(n)
% 计算频谱
omega = linspace(0, 2*pi, 1024); % 高分辨率频率
X = fft(x, 1024); % 频谱

% 32点和8点采样
X_32 = fft(x, 32);
X_8 = fft(x, 8);

% IFFT计算
x_32 = ifft(X_32);
x_8 = ifft(X_8);

% 绘图
figure;

% 1. 绘制频谱幅度
subplot(3, 2, 1);
plot(omega, abs(X)); % 频谱的幅度
title('|X(e^{j\omega})|');
xlabel('\omega');
ylabel('Magnitude');

subplot(3, 2, 2);
stem(0:31, abs(X_32), 'filled');
title('|X_{32}(k)|');
xlabel('k');
ylabel('Magnitude');

subplot(3, 2, 3);
stem(0:7, abs(X_8), 'filled');
title('|X_{8}(k)|');
xlabel('k');
ylabel('Magnitude');

% 2. 绘制时域信号
subplot(3, 2, 4);
stem(n, x, 'filled');
title('x(n)');
xlabel('n');
ylabel('Amplitude');

subplot(3, 2, 5);
stem(0:31, real(x_32), 'filled');
title('x_{32}(n)');
xlabel('n');
ylabel('Amplitude');

subplot(3, 2, 6);
stem(0:7, real(x_8), 'filled');
title('x_{8}(n)');
xlabel('n');
ylabel('Amplitude');

% 调整布局
sgtitle('信号与频谱分析结果'); % 整体标题
