fs = 1000; 
wp = 0.2*pi; 
ws = 0.3*pi;  
Rp = 1;
Rs = 50;  
delta_w = ws - wp;
M = ceil((Rs-8)/(2.285*delta_w));  
if mod(M, 2) == 0  
    M = M + 1;
end
n = -(M-1)/2:(M-1)/2; 
h = (wp/pi)*sinc((wp/pi)*n);  
w = hamming(M);  
h = h .* w'; 
[H, f] = freqz(h, 1, 512, fs);  
A = 20*log10(abs(H));  
f = f / pi; 

% 绘制单位脉冲响应波形图和幅频特性曲线
subplot(4, 1, 1);
stem(n, h);
title('单位脉冲响应h(n)波形图');
xlabel('n');
ylabel('h(n)');
subplot(4, 1, 2);
plot(f, A);
title('幅频衰减特性曲线');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');

% 对语音信号进行滤波并绘制时域波形图
[x, fs] = audioread('motherland.wav');
y = filter(h, 1, x); 
t = (0:length(x)-1)/fs; 
subplot(4, 1, 3);
plot(t, x);
title('语音滤波前时域波形图');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(4, 1, 4);
plot(t, y);
title('语音滤波后时域波形图');
xlabel('Time (s)');
ylabel('Amplitude');
