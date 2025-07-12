% 生成0到3秒的时间向量，步长足够小以近似连续信号
t = linspace(0, 3, 1000);
x = 10*sin(2*pi*t);

% 采样频率为10Hz，采样周期为0.1s
Ts = 0.1;
t_sampled = 0:Ts:3;
x_sampled = 10*sin(2*pi*t_sampled);

% 对采样后的前20点信号进行离散傅里叶变换（DFT）
N = 20;
x_dft = fft(x_sampled(1:N));
freq = (0:N - 1)*(1/Ts)/N;
mag_spectrum = abs(x_dft);
phase_spectrum = angle(x_dft);

% 创建一个图形窗口
figure;

% 绘制连续时间波形图
subplot(3, 1, 1);
plot(t, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Continuous Time Waveform');

% 绘制离散时间波形图（前40点）
subplot(3, 1, 2);
plot(t_sampled(1:40), x_sampled(1:40), 'o');
xlabel('Time (s)');
ylabel('Amplitude');
title('Discrete Time Waveform (First 40 points)');

% 绘制离散幅度频谱和相位频谱图
subplot(3, 2, 5);
stem(freq, mag_spectrum);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum');

subplot(3, 2, 6);
stem(freq, phase_spectrum);
xlabel('Frequency (Hz)');
ylabel('Phase (rad)');
title('Phase Spectrum');