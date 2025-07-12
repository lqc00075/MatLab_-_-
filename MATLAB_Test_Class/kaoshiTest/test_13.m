B=[1,0,0,0,0,0,0,0,-1];
A=[1,0,0,0,0,0,0,0,-0.9];

figure(2);
%第一题
subplot(411);
zplane(B,A);

%第二题
[H,w] = freqz(B,A,"whole");
subplot(412);
plot(w/pi,abs(H));
subplot(413);
plot(w/pi,angle(H));

%第三题
[audio,fs] = audioread("motherland.wav");
yn = filter(B,A,audio);
yn_filter = yn(1:3*fs);
subplot(414);
plot(yn_filter);