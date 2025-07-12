n =0:40;%序列应该取值间隔一吧
xn = sin(pi/4 * n) + cos(pi/5 * n);
figure(2);
subplot(411);
stem(n,xn);

N=40;
X=fft(xn,N);
subplot(412);
stem((0:length(X)-1)/length(X),abs(X),"r","filled");
subplot(413);
stem((0:length(X)-1)/length(X),angle(X),"r","filled");