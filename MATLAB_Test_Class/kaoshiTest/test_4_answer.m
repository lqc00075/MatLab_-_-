% 零极点分布图
num = [1, 1]; % 分子多项式系数
den = [1, 1, 0.25]; % 分母多项式系数
figure(1);
subplot(4,1,1);
zplane(num, den); % 绘制系统的零极点分布图
title('系统的零极点分布图'); % 设置图形标题
% 幅频特性曲线和相频特性曲线
[H, w] = freqz(num, den, 1000); % 计算系统的频率响应
subplot(4, 1, 2); % 将图分为2行1列，当前绘制第1个子图
plot(w, abs(H)); % 绘制幅频特性曲线
xlabel('频率 (rad/sample)'); % 设置横坐标标签
ylabel('幅度'); % 设置纵坐标标签
title('幅频特性曲线'); % 设置图形标题
subplot(4, 1, 3); % 将图分为2行1列，当前绘制第2个子图
plot(w, angle(H)); % 绘制相频特性曲线
xlabel('频率 (rad/sample)'); % 设置横坐标标签
ylabel('相位'); % 设置纵坐标标签
title('相频特性曲线'); % 设置图形标题
% 信号滤波
[y, Fs] = audioread('motherland.wav'); % 读取音频文件
t = (0:length(y)-1) / Fs; % 计算时间坐标
y_filtered = filter(num, den, y); % 对信号进行滤波
subplot(414);
plot(t, y_filtered); % 绘制滤波后的时域波形图
xlabel('时间 (s)'); % 设置横坐标标签
ylabel('幅度'); % 设置纵坐标标签
title('滤波后的时域波形图'); % 设置图形标题

