xn=[1,1,1,1,1,1,1,1,1,1,...
    1,1,1,1,1,1,1,1,1,1];
X= fft(xn,1024);
X8=fft(xn,8);
X32=fft(xn,32);
figure(19);
subplot(511);
plot(0:length(X)-1,abs(X));
xlabel("n")
ylabel("幅值");
title("原信号的频谱图")
subplot(512);
stem(0:length(X8)-1,abs(X8));
xlabel("点数N")
ylabel("幅值");
title("原信号的的8点DFT变化频谱图")
subplot(513);
stem(0:length(X32)-1,abs(X32));
xlabel("点数N")
ylabel("幅值");
title("原信号的的32点DFT变化频谱图")

%第二题
xn_restore = ifft(X);
x8_restore = ifft(X8);
x32_restore = ifft(X32);
figure(20);
subplot(311);
stem(0:length(xn_restore)-1,xn_restore);
subplot(312);
stem(0:length(x8_restore)-1,x8_restore);
subplot(313);
stem(0:length(x32_restore)-1,x32_restore);
