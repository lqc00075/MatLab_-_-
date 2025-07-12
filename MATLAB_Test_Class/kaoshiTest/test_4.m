B=[0,1,1];
A=[1,1,0.25];
figure(2);
%第一题
subplot(411)
zplane(B,A);
legend("零点","极点")

%第二题
[H,w] = freqz(B,A);
subplot(412);
plot(w,abs(H));
subplot(413);
plot(w,angle(H));

%第三题
[xn,fs] = audioread("motherland.wav");
t=(0:length(xn)-1)/fs;
yn = filter(B,A,xn);
yn_new = yn(1:fs);
t_new = (0 : fs - 1) / fs;
subplot(414);
plot(t_new,yn_new);