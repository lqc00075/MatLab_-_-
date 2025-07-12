
Fs = 1; % 归一化频率设计 (Fs = 1 表示数字信号的归一化)

%% 1. 低通滤波器设计
wp = 0.2; % 通带截止频率 (归一化)
ws = 0.3; % 阻带开始频率 (归一化)
dp = 1 - 10^(-1/20); % 通带波动 1dB
ds = 10^(-24/20);    % 阻带衰减 24dB
N = firpmord([wp, ws], [1, 0], [dp, ds]); % 估算滤波器阶数
b_lowpass = firpm(N, [0 wp ws 1], [1 1 0 0]); % FIR设计

% 绘制低通滤波器曲线
figure('Name', '低通滤波器特性');
subplot(2, 2, 1);
stem(b_lowpass, 'filled');
title('低通滤波器冲激响应 h(n)');
xlabel('样本点 n'); ylabel('幅度');

subplot(2, 2, 2);
[H, w] = freqz(b_lowpass, 1, 1024);
plot(w/pi, abs(H));
title('低通滤波器幅频特性曲线');
xlabel('归一化频率 (\times\pi)'); ylabel('幅度');

subplot(2, 2, 3);
plot(w/pi, 20*log10(abs(H)));
title('低通滤波器幅频衰减特性');
xlabel('归一化频率 (\times\pi)'); ylabel('衰减 (dB)');

subplot(2, 2, 4);
plot(w/pi, angle(H));
title('低通滤波器相频特性曲线');
xlabel('归一化频率 (\times\pi)'); ylabel('相位 (弧度)');

%% 2. 高通滤波器设计
ws = 0.4; % 阻带截止频率 (归一化)
wp = 0.6; % 通带开始频率 (归一化)
dp = 1 - 10^(-0.2/20); % 通带波动 0.2dB
ds = 10^(-43/20);      % 阻带衰减 43dB
N = firpmord([ws, wp], [0, 1], [ds, dp]); % 估算滤波器阶数
b_highpass = firpm(N, [0 ws wp 1], [0 0 1 1]); % FIR设计

% 绘制高通滤波器曲线
figure('Name', '高通滤波器特性');
subplot(2, 2, 1);
stem(b_highpass, 'filled');
title('高通滤波器冲激响应 h(n)');
xlabel('样本点 n'); ylabel('幅度');

subplot(2, 2, 2);
[H, w] = freqz(b_highpass, 1, 1024);
plot(w/pi, abs(H));
title('高通滤波器幅频特性曲线');
xlabel('归一化频率 (\times\pi)'); ylabel('幅度');

subplot(2, 2, 3);
plot(w/pi, 20*log10(abs(H)));
title('高通滤波器幅频衰减特性');
xlabel('归一化频率 (\times\pi)'); ylabel('衰减 (dB)');

subplot(2, 2, 4);
plot(w/pi, angle(H));
title('高通滤波器相频特性曲线');
xlabel('归一化频率 (\times\pi)'); ylabel('相位 (弧度)');

%% 3. 带通滤波器设计
wp1 = 0.2; wp2 = 0.6; % 通带范围 (归一化)
ws1 = 0.15; ws2 = 0.65; % 阻带范围 (归一化)
dp = 1 - 10^(-1/20); % 通带波动 1dB
ds = 10^(-50/20);    % 阻带衰减 50dB
N = firpmord([ws1 wp1 wp2 ws2], [0 1 0], [ds dp ds]); % 估算滤波器阶数
b_bandpass = firpm(N, [0 ws1 wp1 wp2 ws2 1], [0 0 1 1 0 0]); % FIR设计

% 绘制带通滤波器曲线
figure('Name', '带通滤波器特性');
subplot(2, 2, 1);
stem(b_bandpass, 'filled');
title('带通滤波器冲激响应 h(n)');
xlabel('样本点 n'); ylabel('幅度');

subplot(2, 2, 2);
[H, w] = freqz(b_bandpass, 1, 1024);
plot(w/pi, abs(H));
title('带通滤波器幅频特性曲线');
xlabel('归一化频率 (\times\pi)'); ylabel('幅度');

subplot(2, 2, 3);
plot(w/pi, 20*log10(abs(H)));
title('带通滤波器幅频衰减特性');
xlabel('归一化频率 (\times\pi)'); ylabel('衰减 (dB)');

subplot(2, 2, 4);
plot(w/pi, angle(H));
title('带通滤波器相频特性曲线');
xlabel('归一化频率 (\times\pi)'); ylabel('相位 (弧度)');

%% 4. 带阻滤波器设计
ws1 = 0.2; ws2 = 0.6; % 阻带范围 (归一化)
wp1 = 0.15; wp2 = 0.65; % 通带范围 (归一化)
dp = 1 - 10^(-1/20); % 通带波动 1dB
ds = 10^(-45/20);    % 阻带衰减 45dB
N = firpmord([wp1 ws1 ws2 wp2], [1 0 1], [dp ds dp]); % 估算滤波器阶数
b_bandstop = firpm(N, [0 wp1 ws1 ws2 wp2 1], [1 1 0 0 1 1]); % FIR设计

% 绘制带阻滤波器曲线
figure('Name', '带阻滤波器特性');
subplot(2, 2, 1);
stem(b_bandstop, 'filled');
title('带阻滤波器冲激响应 h(n)');
xlabel('样本点 n'); ylabel('幅度');

subplot(2, 2, 2);
[H, w] = freqz(b_bandstop, 1, 1024);
plot(w/pi, abs(H));
title('带阻滤波器幅频特性曲线');
xlabel('归一化频率 (\times\pi)'); ylabel('幅度');

subplot(2, 2, 3);
plot(w/pi, 20*log10(abs(H)));
title('带阻滤波器幅频衰减特性');
xlabel('归一化频率 (\times\pi)'); ylabel('衰减 (dB)');

subplot(2, 2, 4);
plot(w/pi, angle(H));
title('带阻滤波器相频特性曲线');
xlabel('归一化频率 (\times\pi)'); ylabel('相位 (弧度)');
