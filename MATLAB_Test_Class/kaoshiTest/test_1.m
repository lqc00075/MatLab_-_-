t = 0:0.01:3;
xt = cos(2*pi*t) + 2*sin(4*pi*t) + 2*cos(6*pi*t) +cos(8*pi*t);
figure(1);
subplot(221);
%第一题
plot(t,xt);
xlabel("时间t(s)")
ylabel("幅值");
title("时域连续波形图")

%第二题
fs = 12;
T=1/fs;
nt = 0:2*12-1;
yt = cos(2*pi*nt*T) + 2*sin(4*pi*nt*T) + 2*cos(6*pi*nt*T) +cos(8*pi*nt*T);
yk = 1/fs*fft(yt,length(nt));
subplot(222);
stem(nt,yt,"filled");
xlabel("采样点N")
ylabel("幅值");
title("两个周期时域连续波形图")

nt = (0:length(yk)-1) *(12/length(yk));
subplot(223);
stem(nt,abs(yk));
xlabel("频率(Hz)")
ylabel("幅值");
title("离散幅度图")

subplot(224);
stem(nt,angle(yk))
xlabel("频率（Hz）")
ylabel("相位");
title("离散相位图")