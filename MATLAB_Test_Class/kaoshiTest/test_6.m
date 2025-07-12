hn = [1,1,1,1,1,1,1,1,1,1];
xn = [1,1,1,1,1,1];

nh = 0:9;
nx = 0:5;
ny1 = nx(1)  + nh(1);
ny2 = nx(end) +nh(end);
ny = ny1:ny2;

yn = conv(xn,hn);
figure(2);
%第一题
subplot(511);
stem(ny,yn,"LineWidth",1.5);

%第二题
N = length(yn);
X = fft(xn,N);
H = fft(hn,N);
Y = fft(yn,N);
Y2 = X.*H;
subplot(512);
plot((0:length(X)-1) / (length(X)),abs(X))
subplot(513);
plot((0:length(H)-1) / (length(H)),abs(H))
subplot(514);
plot((0:length(Y)-1) / (length(Y)),abs(Y))
subplot(515);
plot((0:length(Y2)-1) * (length(Y2)),abs(Y2))