[bd,ad]=myfilter();
%% 第二题
%序列
xn=[-4,-2,0,-4,-6,-4,-2,-4,-6,-6,-4,-4,-6,-6,-2,6,12,8,...
0,-16,-38,-60,-84,-90,-66,-32,-4,-2,-4,8,12,12,10,6,6,6,...
4,0,0,0,0,0,-2,-4,0,0,0,-2,-2,0,0,-2,-2,-2,-2,0];
yn=filter(bd,ad,xn);
%% 绘制
figure(2);
% 绘制滤波前后的心电图波形
subplot(4, 1, 1);
stem(0:length(xn)-1, xn, 'filled');
title('滤波前心电图波形');
xlabel('时间 (采样点)');
ylabel('幅值');

subplot(4, 1, 2);
stem(0:length(yn)-1, yn, 'filled');
title('滤波后心电图波形');
xlabel('时间 (采样点)');
ylabel('幅值');

%% 绘制归一化频率幅频特性曲线
N = 1024; % FFT点数
Xf = fft(xn, N); % 原始信号的FFT
Yf = fft(yn, N); % 滤波后信号的FFT
k = 0:1023;
subplot(4, 1, 3);
plot(k*2/N, abs(Xf)); % 绘制幅频特性
title('滤波前幅频特性');
xlabel('\omega / \pi');
ylabel('幅值');
subplot(4, 1, 4);
plot(k*2/N, abs(Yf)); % 绘制幅频特性
title('滤波后幅频特性');
xlabel('\omega / \pi');
ylabel('幅值');