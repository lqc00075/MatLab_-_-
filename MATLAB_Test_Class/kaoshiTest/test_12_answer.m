% 定义数字滤波器系数
num = [1, 1, 1];
den = [1, -(5/6), -(1/6)];

% 绘制频率响应曲线
[h, w] = freqz(num, den);
figure;
subplot(3, 1, 1);
plot(w/pi, abs(h));
xlabel('归一化频率');
ylabel('幅频特性');
title('数字滤波器幅频特性曲线');

subplot(3, 1, 2);
plot(w/pi, 20*log10(abs(h)));
xlabel('归一化频率');
ylabel('幅度衰减特性');
title('数字滤波器幅度衰减特性曲线');

subplot(3, 1, 3);
plot(w/pi, angle(h));
xlabel('归一化频率');
ylabel('相频特性');
title('数字滤波器相频特性曲线');
% 读取声音文件
[y, fs] = audioread('motherland.wav');

% 数字滤波器处理
y_filtered = filter(num, den, y);

% 计算时间轴
t = (0:length(y)-1) / fs;

% 绘制波形图
figure;
subplot(2, 1, 1);
plot(t, y);
xlabel('时间 (s)');
ylabel('幅值');
title('原始信号波形图');

subplot(2, 1, 2);
plot(t, y_filtered);
xlabel('时间 (s)');
ylabel('幅值');
title('滤波后信号波形图');
