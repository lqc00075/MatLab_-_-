% 参数设置
wp = 0.2 * pi;      % 通带截止频率 (rad/sample)
ws = 0.3 * pi;      % 阻带截止频率 (rad/sample)
alpha_p = 1;        % 通带最大衰减 (dB)
alpha_s = 20;       % 阻带最小衰减 (dB)
Fs = 2000;          % 采样频率 (Hz)

% 计算巴特沃斯低通滤波器的阶数和截止频率
[n, Wn] = buttord(wp / pi, ws / pi, alpha_p, alpha_s); 

% 设计巴特沃斯低通滤波器
[b, a] = butter(n, Wn);

% 画出系统零极点图
figure;
zplane(b, a);
title('系统零极点图');

% 画出滤波器的频率响应
figure;
subplot(2, 1, 1);
freqz(b, a, 1024, Fs);  % 绘制幅频响应
title('滤波器的幅频响应');

% 绘制滤波器的相频响应
subplot(2, 1, 2);
[H, f] = freqz(b, a, 1024, Fs);  % 计算频率响应
plot(f, angle(H));  % 绘制相位响应
title('滤波器的相频响应');
xlabel('频率 (Hz)');
ylabel('相位 (弧度)');

% 加载音频文件
[x, fs] = audioread('motherland.wav');

% 对信号进行滤波
y = filter(b, a, x);

% 绘制原始信号和滤波后信号的波形
figure;
subplot(2, 1, 1);
plot(x(1:3*fs)); % 显示前三秒的信号
title('原始信号');
subplot(2, 1, 2);
plot(y(1:3*fs)); % 显示前三秒的滤波后信号
title('滤波后信号');
