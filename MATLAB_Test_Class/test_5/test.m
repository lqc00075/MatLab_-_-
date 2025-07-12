% 定义信号 x(n)
n = 0:31;
x = zeros(1, 32);
x(1:14) = (0:13) + 1;           % 设置 x(n) = n + 1, 当 0 <= n <= 13
x(15:28) = 27 - (14:27);         % 设置 x(n) = 27 - n, 当 14 <= n <= 25

% 计算 32 点 DFT
X_32 = fft(x, 32);

% 绘制原信号频谱，归一化频率轴
figure;
omega = (0:31) / 32; % 归一化频率轴，从 0 到 1
%plot(omega, abs(X_32));
stem(n, x, '.');
title('FT[x(n)]');
xlabel('\omega/\pi');
ylabel('|X(e^{j\omega})|');
