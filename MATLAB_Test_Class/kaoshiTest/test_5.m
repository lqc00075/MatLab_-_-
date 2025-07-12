xn = [1,2,-1,0,1,2,1];
hn =[1,2,1,0,-1,-2,-1];
nx =-3:3;
nh =0:6;

yn = conv(xn,hn);
ny1 = nx(1) + nh(1);
ny2 = nx(end) + nh(end);
ny = ny1 : ny2;
figure(1);
%第一题
subplot(411);
stem(ny,yn,"r","filled");

%第二题
[H,w] = freqz(hn,1,"whole");
subplot(412);
plot(w,abs(H));
subplot(413);
plot(w,angle(H));
%不具备