% 定义连续信号
t_continuous = 0:0.001:2; % 时间范围为0到2秒，采样间隔为0.001秒
x_continuous = cos(4*pi*t_continuous) + sin(8*pi*t_continuous);

% (1) 画出连续信号x(t)的时域波形图
figure;

subplot(3, 1, 1);
plot(t_continuous, x_continuous);
title('连续信号 x(t) 的时域波形');
xlabel('时间 (秒)');
ylabel('幅度');

% (2) 采样信号x(t)，满足采样定理
Fs = 32; % 选择采样频率，确保满足采样定理，例如选择大于两倍信号最高频率的采样频率
Ts = 1/Fs; % 采样间隔
t_discrete = 0:Ts:2; % 采样时间范围
x_discrete = cos(4*pi*t_discrete) + sin(8*pi*t_discrete);

% 画出采样信号x(t)的时域波形图
subplot(3, 1, 2);
stem(t_discrete, x_discrete);
title('采样信号 x[n] 的时域波形');
xlabel('时间 (秒)');
ylabel('幅度');

% (3) 画出采样信号x(t)的离散幅度谱和离散相位谱
N = length(x_discrete); % 采样点数
X_discrete = fft(x_discrete, N); % 进行FFT变换

% 计算频率轴
frequencies = (0:N-1) * Fs / N;

% 画出离散幅度谱
subplot(3, 1, 3);
stem(frequencies, abs(X_discrete)/N);
title('离散幅度谱');
xlabel('频率 (Hz)');
ylabel('幅度');

% 展示图形
sgtitle('连续信号 x(t) 的时域和频域分析');
