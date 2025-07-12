   %% 变量值
wp = 0.2*pi;
ws = 0.35*pi;
Rp = 1; As = 15;
ripple = 10^(-Rp/20);
Attn = 10^(-As/20);
Fs=10;T=1/Fs;
Omgp=(2/T)*tan(wp/2);%原型通带频率的预修正
Omgs=(2/T)*tan(ws/2);%原型阻带频率的预修正

%% 模拟原型滤波器计算
[n,Omgc]=buttord(Omgp,Omgs,Rp,As,'s');%计算阶数n和截止频率
[z0,p0,k0]=buttap(n);%设计归一化的巴特沃思模拟滤波器原型
bal=k0*real(poly(z0));%求原型滤波器的系数 b
aa1=real(poly(p0));%求原型滤波器的系数 a
[ba,aa]= lp2lp(bal,aa1,Omgc);%变换为模拟低通滤波器 %也可将以上4行替换为[bb,aa]=butter(n,Omgc,'s');直接求模拟滤波器系数
[bd,ad]= bilinear(ba,aa,Fs);%用双线性变换法计算数字滤波器系数
%% 绘制
[H,w]=freqz(bd,ad);
dbH=20*log10((abs(H)+eps)/max(abs(H)));
figure(1);
subplot(2,2,1);plot(w/pi,abs(H));
ylabel("H");title('幅度响应');axis([0,1,0,1.1]);
set(gca,'XTickMode','manual','XTick',[0,0.2,0.35,1]);
set(gca,'YTickMode','manual','YTick',[0,Attn,ripple,1]);grid;

subplot(2,2,2);plot(w/pi,angle(H)/pi);
ylabel('\phi');title('相位响应');axis([0,1,-1,1]);
set(gca,'XTickMode','manual','XTick',[0,0.2,0.35,1]);
set(gca,'YTickMode','manual','YTick',[-1,0,1]);grid

subplot(2,2,3);plot(w/pi,dbH);title('幅度响应(dB)');
ylabel('dB');xlabel('频率(pi)');axis([0,1,-40,5]);
set(gca,'XTickMode','manual','XTick',[0,0.2,0.35,1]);
set(gca,'YTickMode','manual','YTick',[-50,-15,-1,0]);grid

subplot(2,2,4);zplane(bd,ad);
axis([-1.1,1.1,-1.1,1.1]);title('零极点图');

%% 第二题
%序列
xn=[-4,-2,0,-4,-6,-4,-2,-4,-6,-6,-4,-4,-6,-6,-2,6,12,8,...
0,-16,-38,-60,-84,-90,-66,-32,-4,-2,-4,8,12,12,10,6,6,6,...
4,0,0,0,0,0,-2,-4,0,0,0,-2,-2,0,0,-2,-2,-2,-2,0];
yn=filter(bd,ad,xn);
%% 绘制
figure(2);
% 绘制滤波前后的心电图波形
subplot(4, 1, 1);
stem(0:length(xn)-1, xn, 'filled');
title('滤波前心电图波形');
xlabel('时间 (采样点)');
ylabel('幅值');

subplot(4, 1, 2);
stem(0:length(yn)-1, yn, 'filled');
title('滤波后心电图波形');
xlabel('时间 (采样点)');
ylabel('幅值');

%% 绘制归一化频率幅频特性曲线
N = 1024; % FFT点数
Xf = fft(xn, N); % 原始信号的FFT
Yf = fft(yn, N); % 滤波后信号的FFT
k = 0:1023;
subplot(4, 1, 3);
plot(k*2/N, abs(Xf)); % 绘制幅频特性
title('滤波前幅频特性');
xlabel('\omega / \pi');
ylabel('幅值');
subplot(4, 1, 4);
plot(k*2/N, abs(Yf)); % 绘制幅频特性
title('滤波后幅频特性');
xlabel('\omega / \pi');
ylabel('幅值');