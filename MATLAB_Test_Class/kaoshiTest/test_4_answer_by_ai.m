% 定义传递函数 H(z)
numerator = [1, 1]; % z+1 的系数
denominator = [1, 1, 0.25]; % z^2+z+0.25 的系数
sys = tf(numerator, denominator, -1); % 定义离散时间传递函数

% 创建图形窗口
figure;

%% 1. 绘制极零点分布图
subplot(3, 1, 1);
zplane(numerator, denominator); % 极零点分布
title('系统极零点分布');
xlabel('实部'); ylabel('虚部');

%% 2. 绘制频率特性
% 计算频率响应
[H, w] = freqz(numerator, denominator, 1024, 'whole'); % [0, π] 的频率特性
amplitude = abs(H); % 幅值响应
phase = angle(H); % 相位响应

% 绘制幅频特性
subplot(3, 1, 2);
plot(w/pi, amplitude); % 归一化频率 w/π
title('幅频特性');
xlabel('归一化频率 (×π rad/sample)'); ylabel('幅度');

% 绘制相频特性
subplot(3, 1, 3);
plot(w/pi, phase);
title('相频特性');
xlabel('归一化频率 (×π rad/sample)'); ylabel('相位 (rad)');

%% 3. 对音频信号进行滤波
% 加载音频信号
[audio, fs] = audioread('motherland.wav');
filtered_audio = filter(numerator, denominator, audio); % 滤波

% 提取 0-1 秒的音频片段
time = (0:length(audio)-1)/fs; % 时间轴
filtered_time = filtered_audio(1:fs); % 0-1 秒的信号

% 创建新的图形窗口
figure;
plot((0:fs-1)/fs, filtered_time);
title('滤波后信号的波形（0-1 秒）');
xlabel('时间 (s)'); ylabel('振幅');

%% 调整布局
sgtitle('H(z) 系统分析与滤波结果');
