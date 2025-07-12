%% 指标
wp = 0.24 * pi; % 通带截止频率
ws = 0.3 * pi;  % 阻带开始频率
deltaw = ws - wp; % 频率带宽差
N0 = ceil(12* pi / deltaw); % 根据公式计算初始滤波器阶数
N = N0 + mod(N0 + 1, 2); % 确保滤波器阶数为奇数

windows = blackman(N); % 使用窗
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

%% 绘制图像
figure(3);
subplot(2, 2, 1);
stem(n, b, '.'); % 脉冲响应
axis([0, N-1, 1.1 * min(b), 1.1 * max(b)]);
title('实际脉冲响应');
xlabel('n'); ylabel('h(n)');

subplot(2, 2, 2);
stem(n, windows, '.'); % 窗函数特性
axis([0, N-1, 0, 1.1]);
title('窗函数特性');
xlabel('n'); ylabel('w(n)');

subplot(2, 2, 3);
plot(w / pi, db); % 幅度频率响应
axis([0, 1, -80, 10]);
title('幅度频率响应');
xlabel('频率 (单位: \pi)'); ylabel('|H(e^{j\omega})| (dB)');
set(gca, 'XTick', [0, wp/pi, ws/pi, 1]);
set(gca, 'YTick', [-60, -40, -20, 0]); grid on;

subplot(2, 2, 4);
plot(w / pi, pha); % 相位频率响应
axis([0, 1, -4, 4]);
title('相位频率响应');
xlabel('频率 (单位: \pi)'); ylabel('\phi(\omega)');
set(gca, 'XTick', [0, wp/pi, ws/pi, 1]);
set(gca, 'YTick', [-pi, 0, pi]); grid on;

disp(['通带波动 Rp = ', num2str(Rp), ' dB']);
disp(['阻带衰减 As = ', num2str(As), ' dB']);
