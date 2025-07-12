[b,N]= test_2_filter;
yt=fftfilt(b,xt);
Hyk=abs(fft(yt));
%b 为 FIR 数字滤波器的单位脉冲相应 h(m)
figure(14);
subplot(3,1,1);
plot(t,yt);
subplot(3,1,2);
stem(Hyk);
axis([80,120,min(Hyk),max(Hyk)]);

figure(2)
[H,w]=freqz(b,1,"whole");
subplot(3,1,1);
plot(w/pi, 20*log10(abs(H)));
subplot(3,1,2);
plot(w/pi, angle(H));
