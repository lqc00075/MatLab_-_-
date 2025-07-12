[b,N]= test_2_filter;
fs=1000;
[xt, t] = xtg(1000); % 采样频率为 1000 Hz
yt=fftfilt(b,xt);
Hyk=abs(fft(yt));

%滤波器的频响
[H,w] = freqz(b,1,1000,"whole");

fft_xt = abs(fft(xt)); % 原始信号的FFT幅值
fft_yt = abs(fft(yt)); % 滤波后信号的FFT幅值
freqs = (0:length(fft_xt)-1)*(fs/length(fft_xt)); % 频率轴

figure(2);
subplot(4,1,1);
plot(w, 20*log10(abs(H)));
title('FIR滤波器的频率响应');
xlabel('频率 (Hz)');
ylabel('幅值 (dB)');

subplot(4,1,2);
plot(t, xt);
title('原始信号 xt');
xlabel('时间 (s)');
ylabel('幅值');

subplot(4,1,3);
plot(t, yt);
title('滤波后的信号 yt');
xlabel('时间 (s)');
ylabel('幅值');

subplot(4,1,4);
stem(Hyk);
axis([80,120,min(Hyk),max(Hyk)]);
title('滤波后信号的频谱特性（80-120 Hz）');
xlabel('频率 (Hz)'); % 添加 X 轴标签
ylabel('幅值');      % 添加 Y 轴标签
grid on;             % 添加网格方便观察

figure(3);
plot(freqs(1:floor(length(fft_xt)/2)), fft_xt(1:floor(length(fft_xt)/2)), 'b');
hold on;
plot(freqs(1:floor(length(fft_yt)/2)), fft_yt(1:floor(length(fft_yt)/2)), 'r--');
title('信号的幅频特性');
xlabel('频率 (Hz)');
ylabel('幅值');
legend('原始信号', '滤波后信号');
grid on;