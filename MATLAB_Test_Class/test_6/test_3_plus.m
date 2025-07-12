%% 参数初始化
D = 2; % 抽取因子
[xn, fs] = audioread("motherland.wav");
sound(xn, fs);

%% 第一问：直接抽取
yn1 = xn(1:D:end); % 每 D 点抽取 1 点
sound(yn1, fs / D);

%% 第二问：频谱对比
N = 2018;
figure(1);
Xn = 1/fs * fft(xn(8000:8199), N);
subplot(3, 1, 1);
plot((0:N/2-1)*fs/N, abs(Xn(1:N/2))); % 原始信号频谱
title('原始信号频谱');
xlabel('频率 (Hz)');
ylabel('幅度');

Yn1 = D/fs * fft(yn1(4000:4099), N);
subplot(3, 1, 2);
plot((0:N/2-1)*fs/(N*D), abs(Yn1(1:N/2))); % 抽取信号频谱
title('直接抽取信号频谱');
xlabel('频率 (Hz)');
ylabel('幅度');

%% 第三问：抗混叠滤波器设计和应用
wc = pi / D; % 截止频率
wp = wc * 0.9999; % 通带截止频率
ws = wc * 1.04; % 阻带截止频率，确保阻带超出 Nyquist
Rp = 1; % 通带衰减 (dB)
As = 15; % 阻带衰减 (dB)
Fs = fs; % 原始采样频率
T = 1 / Fs;

% 模拟频率转换
Omgp = (2 / T) * tan(wp / 2);
Omgs = (2 / T) * tan(ws / 2);

% Butterworth 滤波器设计
[n, Omgc] = buttord(Omgp, Omgs, Rp, As, 's');
[z0, p0, k0] = buttap(n); % 原型低通滤波器
bal = k0 * real(poly(z0));
aa1 = real(poly(p0));
[ba, aa] = lp2lp(bal, aa1, Omgc); % 转换为目标低通滤波器
[bd, ad] = bilinear(ba, aa, Fs); % 双线性变换离散化

% 抗混叠滤波器频率响应
figure(2);
subplot(2, 1, 1);
[h, w] = freqz(bd, ad, 1024, Fs);
plot(w, abs(h), 'LineWidth', 1.5);
title('抗混叠滤波器幅频特性');
xlabel('频率 (Hz)');
ylabel('幅度');
grid on;

subplot(2, 1, 2);
plot(w, angle(h)*180/pi, 'LineWidth', 1.5);
title('抗混叠滤波器相频特性');
xlabel('频率 (Hz)');
ylabel('相位 (度)');
grid on;

% 抗混叠滤波
yn2 = filter(bd, ad, xn); % 滤波
yn2_downsampled = yn2(1:D:end); % 滤波后抽取
sound(yn2_downsampled, fs / D);

% 滤波后信号频谱
Yn2 = D/fs * fft(yn2_downsampled(4000:4099), N);
figure(1);
subplot(3, 1, 3);
plot((0:N/2-1)*fs/(N*D), abs(Yn2(1:N/2)));
title('抗混叠滤波后信号频谱');
xlabel('频率 (Hz)');
ylabel('幅度');
