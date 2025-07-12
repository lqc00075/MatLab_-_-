hn = [1,2,3,2,1];
xn = [1,1,1,1,1,1];
yn = conv(xn,hn);

%第一题
X=fft(xn,length(xn));
f = (0:length(X)-1)*(1/length(X)); % 频率坐标
figure(1);
subplot(221);
plot(f,abs(X));
xlabel("频率(Hz)");
ylabel("幅度");
title("输入信号的幅度频谱");
%第二题
subplot(222);
zplane(hn,1);
title("零极点分布图")
legend("零点","极点")
%第三题
[H,w] = freqz(hn,1);
subplot(223);
plot(w,abs(H));
subplot(224);
plot(w,angle(H));
