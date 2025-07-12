function [b,N]= test_2_filter
wp = 0.24 * pi; % 通带截止频率
ws = 0.3 * pi;  % 阻带开始频率
deltaw = ws - wp; % 频率带宽差
N0 = ceil(12 * pi / deltaw); % 根据公式计算初始滤波器阶数
N = N0 + mod(N0 + 1, 2); % 确保滤波器阶数为奇数

windows = blackman(N); % 使用窗
wc = (ws + wp) / (2 * pi); % 截止频率取归一化通阻带频率的平均值
b = fir1(N-1, wc, windows); % 设计FIR滤波器