[audio,fs] = audioread("motherland.wav");
n=8000:8399;
y1 = audio(n);
figure(18);
%第一题
subplot(411);
plot((0:length(y1)-1)/fs,y1);
%第二题
Y = fft(y1);
subplot(412);
N=length(Y);
plot((0:N-1)/N,abs(Y));
subplot(413);
plot((0:N-1)/N,angle(Y));