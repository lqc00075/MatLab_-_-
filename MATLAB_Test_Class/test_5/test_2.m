%% 定义信号 x(n)
n = 0:31;

x(1:14) = (0:13) + 1;           % 设置 x(n) = n + 1, 当 0 <= n <= 13
x(15:27) = 27 - (14:26);         % 设置 x(n) = 27 - n, 当 14 <= n <= 25
x(28:32) = 0;
X_FT = fft(x,512);
% 计算 32 点 DFT
X_32 = X_FT(1:512/32:end);
% 提取偶数点得到 16 点频谱采样
X_16 = X_32(1:2:end);
% 计算 16 点 IDFT 重建信号
x_16_reconstructed = ifft(X_16, 16);
x_32_reconstructed = ifft(X_32,32);
% 绘制结果
figure(2);

%% 原信号 x(n)
subplot(3, 2, 1);
stem(n, x, '.');
title('原始信号 x(n)');
xlabel('n');
ylabel('x(n)');

% 原信号的频谱
subplot(3, 2, 2);
k = 0:511; 
plot(k*2/512, abs(X_FT));
title('原信号的频谱');
xlabel('频率');
ylabel('幅度');

%% 16 点频谱幅度
subplot(3, 2, 3);
stem(0:15, abs(X_16), '.');
title('16 点频谱幅度 |X_{16}(k)|');
xlabel('k');
ylabel('|X_{16}(k)|');

% 16 点 IDFT 重建信号
subplot(3, 2, 4);
stem(0:15, real(x_16_reconstructed), '.');
title('16 点 IDFT 重建信号 x_{16}(n)');
xlabel('n');
ylabel('x_{16}(n)');
xlim([0,31]);


%% 32 点频谱幅度
subplot(3, 2, 5);
stem(0:31, abs(X_32), '.');
title('32 点频谱幅度 |X_{32}(k)|');
xlabel('k');
ylabel('|X_{32}(k)|');


% 32 点 IDFT 重建信号
subplot(3, 2, 6);
stem(0:31, real(x_32_reconstructed), '.');
title('32 点 IDFT 重建信号 x_{32}(n)');
xlabel('n');
ylabel('x_{32}(n)');



