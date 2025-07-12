%% 指标
wp = 0.2 * pi; % 通带截止频率
ws = 0.3 * pi;  % 阻带开始频率
deltaw = ws - wp; % 频率带宽差
N0 = ceil(12* pi / deltaw); % 根据公式计算初始滤波器阶数
N = N0 + mod(N0 + 1, 2); % 确保滤波器阶数为奇数

windows = triang(N); % 使用窗
wc = (ws + wp) / (2 * pi); % 截止频率取归一化通阻带频率的平均值
b = fir1(N-1, wc, windows); % 设计FIR滤波器

[H, w] = freqz(b, 1, 1000, 'whole'); % 计算频率响应
H = H(1:501)'; % 只取[0, pi]部分
w = w(1:501)';
mag = abs(H);
db = 20 * log10((mag + eps) / max(mag)); % 幅度转换为分贝
pha = angle(H); % 相位响应
n = 0:N-1; % 脉冲响应时间序列
dw = 2 * pi / 1000; % 频率步长
%% 检验参数
% Rp = -(min(db(1:floor(wp/dw)+1))); % 检验通带波动
% As = -round(max(db(floor(ws/dw)+1:501))); % 检验最小阻带衰减

Rp=-(min(db(1:wp/dw+1)))%检验通带波动
As=-round(max(db(ws/dw+1:501)))%检验最小阻带衰减

% 绘图
figure(1);

% (1) 单位脉冲响应 h(n) 的时域波形
subplot(3, 1, 1);
stem(n, b, 'filled');
xlabel('n');
ylabel('h(n)');
title('单位脉冲响应 h(n) 时域波形');

% (2) 频率响应的幅频和相频特性
subplot(3, 1, 2);
plot(w/pi, db);
xlabel('归一化频率 (\times \pi rad/sample)');
ylabel('幅值 (dB)');
title('幅频响应');
grid on;

subplot(3, 1, 3);
plot(w/pi, pha);
xlabel('归一化频率 (\times \pi rad/sample)');
ylabel('相位 (radians)');
title('相频响应');
grid on;

% (3) 对音频信号进行滤波
[motherland, fs] = audioread('motherland.wav'); % 读取音频
filtered_signal = filter(b, 1, motherland); % 滤波
time = (0:length(filtered_signal)-1) / fs; % 时间轴

% 截取前 3 秒信号
% filtered_signal_3s = filtered_signal(1:min(end, 3 * fs));
% time_3s = time(1:min(end, 3 * fs));
filtered_signal_3s = filtered_signal(1:3 * fs); % 提取前 3 秒的信号
time_3s = time(1:3 * fs); % 提取对应的时间轴

% 绘制滤波后信号的时域波形
figure(2);
plot(time_3s, filtered_signal_3s);
xlabel('时间 (s)');
ylabel('幅度');
title('滤波后信号的时域波形（前 3 秒）');
grid on;
