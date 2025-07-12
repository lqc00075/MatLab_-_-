B=[1,1,1];
A=[1,-(5/6),(1/6)];
[H,w]=freqz(B,A);
figure(15);
%第一题
subplot(411);
plot(w/pi,abs(H));
subplot(412);
plot(w/pi,angle(H));
%第二题
[a,fs] = audioread("motherland.wav");
y_15 = filter(B,A,a);
subplot(413);
plot((0:length(y_15)-1) / fs,y_15);
subplot(414);
plot((0:length(a)-1) / fs,a);