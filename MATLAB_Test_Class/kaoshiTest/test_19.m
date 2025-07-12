hn = [1,1,1,1,1];
[audio,fs] = audioread("motherland.wav");
y1 = conv(audio,hn);
figure(19);
subplot(411);
plot((0:length(audio)-1)/fs,audio);
subplot(412);
plot((0:length(y1)-1)/fs,y1);

y2=audio(16000:16199);
subplot(413);
Y = fft(y2);
plot((0:length(y2)-1)/length(y2),abs(y2));
