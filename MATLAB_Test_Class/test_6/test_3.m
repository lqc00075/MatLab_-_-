%% 第一问
D=2;
[xn,fs]=audioread("motherland.wav");
sound(xn,fs);
pause(length(xn)/fs);
yn1=xn(1:D:length(xn));%每个D-1个点抽取一点 
sound(yn1,fs/D);

%% 第二问
N=2018;
figure(1);
Xn=1/fs*fft(xn(8000:8199),N);
subplot(311);
plot((0:N/2-1)*fs/N,abs(Xn(1:N/2)));% 模拟域幅度谱
subplot(312);
Yn1=D/fs*fft(yn1(8000:8099),N);%2点取1点后,200点长变成了100点长
plot((0:N/2-1)*fs/(N*D),abs(Yn1(1:N/2)));% 模拟域幅度谱

%% 第三问
wc = pi / D; % 截止频率（归一化）
wp = wc * 0.8; % 通带截止频率 (稍低于截止频率，留出过渡带)
ws = wc * 1.2; % 阻带截止频率 (稍高于截止频率)
Rp = 1; % 通带波动 (dB)
As = 15; % 阻带衰减 (dB)
Fs = fs/D; % 采样频率
T = 1 / Fs; % 采样周期

%% 预修正模拟原型频率
Omgp = (2 / T) * tan(wp / 2); % 原型通带频率的预修正
Omgs = (2 / T) * tan(ws / 2); % 原型阻带频率的预修正

%% 模拟原型滤波器设计
[n, Omgc] = buttord(Omgp, Omgs, Rp, As, 's'); % 计算阶数和截止频率
[z0, p0, k0] = buttap(n); % 设计归一化的巴特沃思模拟滤波器原型
bal = k0 * real(poly(z0)); % 求原型滤波器的系数 b
aa1 = real(poly(p0)); % 求原型滤波器的系数 a
[ba, aa] = lp2lp(bal, aa1, Omgc); % 转换为模拟低通滤波器
[bd, ad] = bilinear(ba, aa, Fs); % 用双线性变换法计算数字滤波器系数
yn2=filter(bd,ad,xn);
sound(yn2,fs/D);

%% 滤波器频率响应
% [H, w] = freqz(bd, ad);
% dbH = 20 * log10((abs(H) + eps) / max(abs(H)));
% 
% figure(2);
% subplot(2, 2, 1); plot(w / pi, abs(H));
% ylabel("H"); title('幅度响应'); axis([0, 1, 0, 1.1]);
% set(gca, 'XTickMode', 'manual', 'XTick', [0, wc/pi, 1]);
% set(gca, 'YTickMode', 'manual', 'YTick', [0, ripple, 1]); grid;
% 
% subplot(2, 2, 2); plot(w / pi, angle(H) / pi);
% ylabel('\phi'); title('相位响应'); axis([0, 1, -1, 1]);
% set(gca, 'XTickMode', 'manual', 'XTick', [0, wc/pi, 1]);
% set(gca, 'YTickMode', 'manual', 'YTick', [-1, 0, 1]); grid;
% 
% subplot(2, 2, 3); plot(w / pi, dbH); title('幅度响应 (dB)');
% ylabel('dB'); xlabel('频率 (pi)'); axis([0, 1, -40, 5]);
% set(gca, 'XTickMode', 'manual', 'XTick', [0, wc/pi, 1]);
% set(gca, 'YTickMode', 'manual', 'YTick', [-50, -15, -1, 0]); grid;
% 
% subplot(2, 2, 4); zplane(bd, ad);
% axis([-1.1, 1.1, -1.1, 1.1]); title('零极点图');
