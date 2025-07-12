% 读取音频信号
[xn, Fs] = audioread('motherland.wav'); % 读取音频文件
sound(xn, Fs); % 播放原始音频
%pause(length(xn)/Fs); % 等待音频播放完成

% (1) 对 xn 进行 I=2 的整数倍插值
I = 2; % 插值倍数
%yn1 = zeros(I * length(xn), 1); % 插值后的信号初始化
for i = 1:length(xn)
    yn1(I*i-1) =xn(i);
    yn1(I*i) = 0;
end
sound(yn1, I * Fs); % 播放插值后的信号
%pause(length(yn1)/(I * Fs)); % 等待插值信号播放完成

% (2) 对原始信号和插值信号进行频谱分析
N = 2048; % FFT 点数
Xn = 1/Fs*fft(xn(8000:8199), N); % 原始信号选取 200 点做频谱分析
Yn1 = 1/(I*Fs) * fft(yn1(16000:16399), N); % 插值信号对应频段做频谱分析

% 绘制原始信号和插值信号的频谱
figure;
subplot(3, 1, 1);
plot((0:N/2-1)*(Fs/N), abs(Xn(1:N/2)));
title('原始信号xn频谱');
xlabel('频率 (Hz)');
ylabel('幅度');

subplot(3, 1, 2);
plot((0:N/2-1)*(I*Fs/N), abs(Yn1(1:N/2)));
title('插值信号yn1频谱');
xlabel('频率 (Hz)');
ylabel('幅度');

% (3) 设计镜像低通滤波器对插值信号进行滤波
b = test_5_filter;
yn2 =filter(b, 1, yn1); % 滤波后的信号
sound(yn2, I * Fs); % 播放滤波后的信号


% 频谱分析滤波后的信号
Yn2 = abs(1/Fs * fft(yn2(16000:16399), N)); % 滤波后插值信号频谱

% 绘制滤波后插值信号的频谱
subplot(3, 1, 3);
plot((0:N/2-1)*(I*Fs/N), Yn2(1:N/2));
title('滤波后插值信号yn2频谱');
xlabel('频率 (Hz)');
ylabel('幅度');
