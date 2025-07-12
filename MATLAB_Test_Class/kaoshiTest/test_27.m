%% 参数初始化
D = 3; % 抽取因子
[xn, fs] = audioread("motherland.wav");

yn1 = xn(1:D:end); % 每 D 点抽取 1 点

wc = pi / D; % 截止频率
wp = wc * 0.98; % 通带截止频率
ws = wc * 1.04; % 阻带截止频率，确保阻带超出 Nyquist
Rp = 1; % 通带衰减 (dB)
As = 20; % 阻带衰减 (dB)
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

[H,w] = freqz(bd,ad);
figure(27);
%第一题
subplot(411);
plot(w/pi,abs(H));
subplot(412);
plot(w/pi,angle(H));
%第二题
[audio,fs_27] = audioread("motherland.wav");
yn_27 = filter(bd,ad,audio);
xn1= yn_27(1:D:end);
X=fft(xn1(8000:8100));
subplot(413);
plot((0:length(X)-1)*fs_27/length(X)/D,abs(X));
subplot(414);
plot((0:length(X)-1),angle(X));