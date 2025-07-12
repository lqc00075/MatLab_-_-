% 系统的单位样值响应
h = [1,1,1,1,1,1,1,1,1,1];
% 输入信号
x = [1,1,1,1,1,1];
% 零状态响应
y = conv(x, h);
% 时域波形图
n = 0:length(y)-1;
figure(1);
subplot(411);
stem(n, y);
xlabel('n');
ylabel('y(n)');
title('零状态响应的时域波形图');
% 连续幅度频谱图
N = length(y);

X = fft(x, N);
H = fft(h, N);
Y = X .* H;
subplot(4, 1, 2);
plot((0:length(X)-1)/length(X), abs(X));
xlabel('频率 (rad)');
ylabel('幅度');
title('输入信号的连续幅度频谱图');
subplot(4, 1, 3);
plot((0:length(H)-1)/length(H), abs(H));
xlabel('频率 (rad)');
ylabel('幅度');
title('单位样值响应的连续幅度频谱图');
subplot(4, 1, 4);
plot((0:length(Y)-1)/length(Y), abs(Y));
xlabel('频率 (rad)');
ylabel('幅度');
title('输出信号的连续幅度频谱图');
