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