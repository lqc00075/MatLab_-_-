n = 0:96;
xn = cos(pi/4 * n) + cos(pi/8 * n) + cos(pi/12 * n) + cos(pi/24 * n);

%第一题
xn1 = xn(1:48);
xn2 = xn(1:96);
figure(1);
subplot(321)
stem(0:length(xn1)-1,xn1,"b","filled");
xlabel("n");
ylabel("幅值");
title("x1(n)的波形图(0~47)")
subplot(322)
stem(0:length(xn2)-1,xn2,"r","filled");
xlabel("n");
ylabel("幅值");
title("x2(n)的波形图(0~95)")

%第二题
N1=48;
N2=96;
xk1=fft(xn1,N1);
xk2=fft(xn2,N2);

subplot(323)
stem(0:length(xk1)-1,abs(xk1),"b","filled");
xlabel("n");
ylabel("幅值");
title("x1(n)的离散幅度谱")
subplot(324)
stem(0:length(xk1)-1,angle(xk1),"r","filled");
xlabel("n");
ylabel("幅值");
title("x2(n)的离散幅度谱")

subplot(325)
stem(0:length(xk2)-1,abs(xk2),"b","filled");
xlabel("n");
ylabel("相位");
title("x1(n)的离散相位谱")
subplot(326)
stem(0:length(xk2)-1,angle(xk2),"r","filled");
xlabel("n");
ylabel("幅值");
title("x2(n)的离散相位谱")
