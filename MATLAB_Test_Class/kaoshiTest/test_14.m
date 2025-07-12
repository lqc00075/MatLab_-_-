t=0:0.01:3;
xt = 10*sin(2*pi*t);
figure(14);
%第一题
subplot(411);
plot(t,xt);

fs = 10;
T = 1/fs;
n=0:40;
xn = 10*sin(2*pi*n*T);
%第二题
subplot(412);
stem(n,xn);

%第三题
X=fft(xn,20);
subplot(413);
stem((0:length(X)-1)/length(X) * fs,abs(X));
subplot(414);
stem((0:length(X)-1)/length(X) * fs,angle(X));