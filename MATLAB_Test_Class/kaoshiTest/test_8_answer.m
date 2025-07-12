wp = 0.2*pi;
ws = 0.3*pi;
ap = 1;
as = 25;

% 设计参数
wp = 0.2*pi;
ws = 0.3*pi;
ap = 1;
as = 25;

% 设计FIR滤波器，使用窗函数法
N = 101; % 设置滤波器的阶数
window = hamming(N+1); % 使用汉明窗

b = fir1(N, [wp, ws]/pi, 'bandpass', window);

% (1) 求单位脉冲响应h(n)并画出时域波形图
figure(5);
subplot(2, 2, 1);
stem(0:N, b);
title('单位脉冲响应h(n)');
xlabel('n');
ylabel('h(n)');

% (2) 画出一个周期的幅频特性和相频特性曲线
subplot(2, 2, 2);
[H, w] = freqz(b, 1,1000);
plot(w,abs(H));
title('幅频特性');
subplot(2, 2, 3);
grpdelay(b, 1);
title('相频特性');
% 对信号motherland.wav进行滤波
[x, fs] = audioread('motherland.wav');
y = filter(b, 1, x);
% (3) 画出信号滤波后的前3秒内的时域波形图
subplot(2, 2, 4);
plot((0:length(y)-1)/fs, y);
title('滤波后信号');
xlabel('时间 (秒)');
ylabel('幅度');
