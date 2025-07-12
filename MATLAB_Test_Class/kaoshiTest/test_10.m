%% 指标
wp = 0.3 * pi; % 通带截止频率
ws = 0.4 * pi;  % 阻带开始频率
deltaw = ws - wp; % 频率带宽差
N0 = ceil(6.2* pi / deltaw); % 根据公式计算初始滤波器阶数
N = N0 + mod(N0 + 1, 2); % 确保滤波器阶数为奇数

windows = hamming(N); % 使用窗
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

%第一题
figure(2);
subplot(411);
stem(n,b,"r","filled");

subplot(412);
%幅度
plot(w/pi,db);
subplot(413);
%相位
plot(w/pi,pha);

[audio,fs] = audioread("motherland.wav");
yn=filter(b,1,audio);
t_my = 0:fs-1;
yn_my = yn(1:fs);
subplot(414);
plot(t_my/fs,yn_my);