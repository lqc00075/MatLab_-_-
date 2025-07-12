% 通用参数设置
alpha_p = 1;  % 通带衰减 (dB)
alpha_s = 45; % 阻带衰减 (dB)

% ----------------- 低通滤波器设计 -----------------
wp_lp = 0.2 * pi; % 低通通带截止频率
ws_lp = 0.3 * pi; % 低通阻带截止频率
[n_lp, wn_lp] = buttord(wp_lp/pi, ws_lp/pi, 1, 20); % 计算阶数
[b_lp, a_lp] = butter(n_lp, wn_lp, 'low'); % 低通滤波器
[h_lp, w_lp] = freqz(b_lp, a_lp, 1024); % 频率响应

% 绘图：低通滤波器
figure;
subplot(3,1,1);
plot(w_lp/pi, abs(h_lp), 'LineWidth', 1.5);
title('低通滤波器 - 幅度响应');
xlabel('归一化频率 (×π rad/sample)');
ylabel('|H|');
grid on;

subplot(3,1,2);
plot(w_lp/pi, 20*log10(abs(h_lp)), 'LineWidth', 1.5);
title('低通滤波器 - 幅度响应 (dB)');
xlabel('归一化频率 (×π rad/sample)');
ylabel('幅度 (dB)');
grid on;

subplot(3,1,3);
plot(w_lp/pi, angle(h_lp)*180/pi, 'LineWidth', 1.5);
title('低通滤波器 - 相频特性');
xlabel('归一化频率 (×π rad/sample)');
ylabel('相位 (度)');
grid on;

% ----------------- 高通滤波器设计 -----------------
wp_hp = 0.6 * pi; % 高通通带截止频率
ws_hp = 0.4 * pi; % 高通阻带截止频率
[n_hp, wn_hp] = buttord(wp_hp/pi, ws_hp/pi, 2, 30); % 计算阶数
[b_hp, a_hp] = butter(n_hp, wn_hp, 'high'); % 高通滤波器
[h_hp, w_hp] = freqz(b_hp, a_hp, 1024); % 频率响应

% 绘图：高通滤波器
figure;
subplot(3,1,1);
plot(w_hp/pi, abs(h_hp), 'LineWidth', 1.5);
title('高通滤波器 - 幅度响应');
xlabel('归一化频率 (×π rad/sample)');
ylabel('|H|');
grid on;

subplot(3,1,2);
plot(w_hp/pi, 20*log10(abs(h_hp)), 'LineWidth', 1.5);
title('高通滤波器 - 幅度响应 (dB)');
xlabel('归一化频率 (×π rad/sample)');
ylabel('幅度 (dB)');
grid on;

subplot(3,1,3);
plot(w_hp/pi, angle(h_hp)*180/pi, 'LineWidth', 1.5);
title('高通滤波器 - 相频特性');
xlabel('归一化频率 (×π rad/sample)');
ylabel('相位 (度)');
grid on;

% ----------------- 带通滤波器设计 -----------------
wp_bp = [0.2*pi, 0.6*pi]; % 带通通带范围
ws_bp = [0.15*pi, 0.65*pi]; % 带通阻带范围
[n_bp, wn_bp] = buttord(wp_bp/pi, ws_bp/pi, alpha_p, alpha_s); % 计算阶数
[b_bp, a_bp] = butter(n_bp, wn_bp, 'bandpass'); % 带通滤波器
[h_bp, w_bp] = freqz(b_bp, a_bp, 1024); % 频率响应

% 绘图：带通滤波器
figure;
subplot(3,1,1);
plot(w_bp/pi, abs(h_bp), 'LineWidth', 1.5);
title('带通滤波器 - 幅度响应');
xlabel('归一化频率 (×π rad/sample)');
ylabel('|H|');
grid on;

subplot(3,1,2);
plot(w_bp/pi, 20*log10(abs(h_bp)), 'LineWidth', 1.5);
title('带通滤波器 - 幅度响应 (dB)');
xlabel('归一化频率 (×π rad/sample)');
ylabel('幅度 (dB)');
grid on;

subplot(3,1,3);
plot(w_bp/pi, angle(h_bp)*180/pi, 'LineWidth', 1.5);
title('带通滤波器 - 相频特性');
xlabel('归一化频率 (×π rad/sample)');
ylabel('相位 (度)');
grid on;

% ----------------- 带阻滤波器设计 -----------------
wp_bs = [0.15*pi, 0.65*pi]; % 带阻通带范围
ws_bs = [0.2*pi, 0.6*pi]; % 带阻阻带范围
[n_bs, wn_bs] = buttord(wp_bs/pi, ws_bs/pi, alpha_p, alpha_s); % 计算阶数
[b_bs, a_bs] = butter(n_bs, wn_bs, 'stop'); % 带阻滤波器
[h_bs, w_bs] = freqz(b_bs, a_bs, 1024); % 频率响应

% 绘图：带阻滤波器
figure;
subplot(3,1,1);
plot(w_bs/pi, abs(h_bs), 'LineWidth', 1.5);
title('带阻滤波器 - 幅度响应');
xlabel('归一化频率 (×π rad/sample)');
ylabel('|H|');
grid on;

subplot(3,1,2);
plot(w_bs/pi, 20*log10(abs(h_bs)), 'LineWidth', 1.5);
title('带阻滤波器 - 幅度响应 (dB)');
xlabel('归一化频率 (×π rad/sample)');
ylabel('幅度 (dB)');
grid on;

subplot(3,1,3);
plot(w_bs/pi, angle(h_bs)*180/pi, 'LineWidth', 1.5);
title('带阻滤波器 - 相频特性');
xlabel('归一化频率 (×π rad/sample)');
ylabel('相位 (度)');
grid on;
