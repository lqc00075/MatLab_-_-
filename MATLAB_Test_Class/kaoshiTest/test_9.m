t=0:0.01:2;
xt = cos(4*pi*t) + sin(8*pi*t);

figure(2);
%第一题
subplot(411);
plot(t,xt);
%第二题 fmin = 8
fs = 32;
T = 1/fs;
n = 0:2*32-1;
xn = cos(4*pi*n*T) + sin(8*pi*n*T);
subplot(412);
stem(0:length(n)-1,xn);

xn_my = fft(xn,32);
subplot(413);
stem(0:length(xn_my)-1,abs(xn_my));

subplot(414);
stem(0:length(xn_my)-1,angle(xn_my));