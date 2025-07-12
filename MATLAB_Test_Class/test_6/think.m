%% 设计低通滤波器
% 参数设置
wp = 0.2 * pi; 
ws = 0.3 * pi;
ap = 1; 
as = 20;

% 设计低通滤波器
[n, Wn] = buttord(wp/pi, ws/pi, ap, as);
[b, a] = butter(n, Wn, 'low');

% 绘制幅频特性和相频特性
[H, w] = freqz(b, a, 1024);
figure('Name','低通滤波器');
subplot(2, 1, 1);
plot(w/pi, 20*log10(abs(H)));
title('低通滤波器 - 幅频特性');
xlabel('\omega / \pi');
ylabel('幅值 (dB)');
grid on;

subplot(2, 1, 2);
plot(w/pi, angle(H));
title('低通滤波器 - 相频特性');
xlabel('\omega / \pi');
ylabel('相位 (rad)');
grid on;

%% 设计高通滤波器
% 参数设置
wp = 0.6 * pi;
ws = 0.4 * pi;
ap = 2; 
as = 30;

% 设计高通滤波器
[n, Wn] = buttord(wp/pi, ws/pi, ap, as);
[b, a] = butter(n, Wn, 'high');

% 绘制幅频特性和相频特性
[H, w] = freqz(b, a, 1024);
figure('Name','高通滤波器');
subplot(2, 1, 1);
plot(w/pi, 20*log10(abs(H)));
title('高通滤波器 - 幅频特性');
xlabel('\omega / \pi');
ylabel('幅值 (dB)');
grid on;

subplot(2, 1, 2);
plot(w/pi, angle(H));
title('高通滤波器 - 相频特性');
xlabel('\omega / \pi');
ylabel('相位 (rad)');
grid on;

%% 设计带通滤波器
% 参数设置
wp = [0.2, 0.6] * pi; 
ws = [0.15, 0.65] * pi;
ap = 1; 
as = 45;

% 设计带通滤波器
[n, Wn] = buttord(wp/pi, ws/pi, ap, as);
[b, a] = butter(n, Wn, 'bandpass');

% 绘制幅频特性和相频特性
[H, w] = freqz(b, a, 1024);
figure('Name','带通滤波器');
subplot(2, 1, 1);
plot(w/pi, 20*log10(abs(H)));
title('带通滤波器 - 幅频特性');
xlabel('\omega / \pi');
ylabel('幅值 (dB)');
grid on;

subplot(2, 1, 2);
plot(w/pi, angle(H));
title('带通滤波器 - 相频特性');
xlabel('\omega / \pi');
ylabel('相位 (rad)');
grid on;

%% 设计带阻滤波器
% 参数设置
wp = [0.15, 0.65] * pi;
ws = [0.2, 0.6] * pi;
ap = 1; 
as = 45;

% 设计带阻滤波器
[n, Wn] = buttord(wp/pi, ws/pi, ap, as);
[b, a] = butter(n, Wn, 'stop');

% 绘制幅频特性和相频特性
[H, w] = freqz(b, a, 1024);
figure('Name','带阻滤波器');
subplot(2, 1, 1);
plot(w/pi, 20*log10(abs(H)));
title('带阻滤波器 - 幅频特性');
xlabel('\omega / \pi');
ylabel('幅值 (dB)');
grid on;

subplot(2, 1, 2);
plot(w/pi, angle(H));
title('带阻滤波器 - 相频特性');
xlabel('\omega / \pi');
ylabel('相位 (rad)');
grid on;
