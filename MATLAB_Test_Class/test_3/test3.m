%第一题
B1=[2,16,44,56,32];
A1=[3,3,-15,18,-12];
[B,P,K]=residuez(B1,A1);

%第二题第一问
B2=[0,2,-1.6,-0.9];
A2=[1,-2.5,1.96,-0.48];
[B_2_1,P_2_1,K_2_1]=tf2zp(B2,A2);
zplane(B2,A2);
grid on;
legend("零点","极点");

%第二题第二问
B2_2=[0,0,0,1,-1];
A2_2=[1,-0.9,-0.65,0.873,0];
[B_2_2,P_2_2,K_2_2]=tf2zp(B2_2,A2_2);
figure(2);
zplane(B2_2,A2_2);
grid on;
legend("零点","极点");

%第三题
B3=[1,0,0];
A3=[1,-3/4,1/8];
[H,w]=freqz(B3,A3,400,"whole");
Hm=abs(H);
Hp=angle(H);
figure(3);
subplot(211);
plot(w,Hm),grid on;
xlabel("\omega(rad/s)"),ylabel("Magnitude");
title("离散系统幅频特性");
subplot(212);
plot(w,Hp),grid on;
xlabel("\omega(rad/s)"),ylabel("Phase");
title("离散系统相频特性");

%第四题
B4=[1,0,0,0,0,0,0,0,-1];
A4=[1,0,0,0,0,0,0,0,-0.9];
figure(4);
[B4_1,P4,K4]=tf2zp(B4,A4);
subplot(311);
zplane(B4,A4);
grid on;
legend("零点","极点");

[H_2,w_2]=freqz(B4,A4,400,"whole");
Hm_2=abs(H_2);
Hp_2=angle(H_2);
subplot(312);
plot(w_2,Hm_2),grid on;
xlabel("\omega(rad/s)"),ylabel("Magnitude");
title("离散系统幅频特性");
subplot(313);
plot(w_2,Hp_2),grid on;
xlabel("\omega(rad/s)"),ylabel("Phase");
title("离散系统相频特性");

%思考题一
% 读取音频文件
[audio, fs] = audioread('motherland.wav');  % 加载音频文件
t = (0:length(audio)-1) / fs;  % 时间向量，单位为秒

% 提取1到2秒的音频片段
start_sample = fs * 1;  % 对应1秒的样本索引
end_sample = fs * 2;    % 对应2秒的样本索引
audio_segment = audio(start_sample:end_sample);

% 定义三个滤波器的系数
% H1(z) = z / (z + 0.8)
b1 = [1 0];  % 分子系数
a1 = [1 0.8];  % 分母系数

% H2(z) = z / (z - 1)
b2 = [1 0];
a2 = [1 -1];

% H3(z) = z / (z + 1.2)
b3 = [1 0];
a3 = [1 1.2];

% 对音频片段进行滤波
filtered_audio1 = filter(b1, a1, audio_segment);
filtered_audio2 = filter(b2, a2, audio_segment);
filtered_audio3 = filter(b3, a3, audio_segment);

% 绘制原始和滤波后音频的波形
time_segment = (0:length(audio_segment)-1) / fs;  % 1-2秒片段的时间向量

figure(6);

% 原始音频片段的波形
subplot(4,1,1);
plot(time_segment, audio_segment);
title('原始音频片段（1秒到2秒）');
xlabel('时间 (秒)');
ylabel('幅度');

% 滤波后的音频波形
subplot(4,1,2);
plot(time_segment, filtered_audio1);
title('滤波后音频 H_1(z) = z / (z + 0.8)');
xlabel('时间 (秒)');
ylabel('幅度');

subplot(4,1,3);
plot(time_segment, filtered_audio2);
title('滤波后音频 H_2(z) = z / (z - 1)');
xlabel('时间 (秒)');
ylabel('幅度');

subplot(4,1,4);
plot(time_segment, filtered_audio3);
title('滤波后音频 H_3(z) = z / (z + 1.2)');
xlabel('时间 (秒)');
ylabel('幅度');

% 解释滤波后的幅度变化原因：
% 不同的滤波器会对音频信号的频率成分进行不同的处理，
% 例如 H1 和 H3 滤波器具有低通特性，可能会减少高频成分，从而平滑信号；
% H2 滤波器具有高通特性，可能会增加高频成分的比例，增强信号的高频变化。
% 这些频率成分的变化导致了时间域中信号幅度的不同表现。


%思考题二
B_think_2=[1,-2,2];
A_think_2=[2,-2,1];
figure(5);
[B_think,P_think,K_think]=tf2zp(B_think_2,A_think_2);
subplot(311);
zplane(B_think_2,A_think_2);
grid on;
legend("零点","极点");
[H_think,w_think]=freqz(B_think_2,A_think_2,400,"whole");
Hm_think=abs(H_think);
Hp_think=angle(H_think);
subplot(312);
plot(w_think,Hm_think),grid on;
xlabel("\omega(rad/s)"),ylabel("Magnitude");
title("离散系统幅频特性");
subplot(313);
plot(w_think,Hp_think),grid on;
xlabel("\omega(rad/s)"),ylabel("Phase");
title("离散系统相频特性");