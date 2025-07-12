%% 参数初始化
A = 444.128;
alpha = 50 * sqrt(2)*pi;
Omega_0 = 50 * sqrt(2)*pi;
Tp = 0.064;         % 观测时间 64 ms

%% ------------------ Fs = 1000 Hz ------------------
Fs1 = 1000;
T1 = 1 / Fs1;
N1 = ceil(Tp * Fs1);
n1 = 0:N1-1;
x_n1 = A * exp(-alpha * n1 * T1) .* sin(Omega_0 * n1 * T1);

% 计算 FFT 并获取频谱特性
X_k1 = T1 * fft(x_n1, N1);
f1 = (0:N1-1) * (Fs1 / N1);

% 绘制时域采样信号
subplot(3, 2, 1);
stem(n1, x_n1, '.');
axis([0, N1, -100, 200]);
title('(a) Fs=1000Hz');
xlabel('n');
ylabel('x_a(n)');

% 绘制频域幅频特性
subplot(3, 2, 2);
plot(f1, abs(X_k1));
axis([0, Fs1, 0, 1]);
title('(a) T*FT[x_a(nT)], Fs=1000Hz');
xlabel('f(Hz)');
ylabel('幅度');

%% ------------------ Fs = 200 Hz ------------------
Fs2 = 200;
T2 = 1 / Fs2;
N2 = ceil(Tp * Fs2);
n2 = 0:N2-1;
x_n2 = A * exp(-alpha * n2 * T2) .* sin(Omega_0 * n2 * T2);

% 计算 FFT 并获取频谱特性
X_k2 = T2 * fft(x_n2, N2);
f2 = (0:N2-1) * (Fs2 / N2);

% 绘制时域采样信号
subplot(3, 2, 3);
stem(n2, x_n2, '.');
axis([0, N2, -100, 200]);
title('(a) Fs=200Hz');
xlabel('n');
ylabel('x_a(n)');

% 绘制频域幅频特性
subplot(3, 2, 4);
plot(f2, abs(X_k2));
axis([0, Fs2, 0, 1]);
title('(a) T*FT[x_a(nT)], Fs=200Hz');
xlabel('f(Hz)');
ylabel('幅度');

%% ------------------ Fs = 300 Hz ------------------
Fs3 = 300;
T3 = 1 / Fs3;
N3 = ceil(Tp * Fs3);
n3 = 0:N3-1;
x_n3 = A * exp(-alpha * n3 * T3) .* sin(Omega_0 * n3 * T3);

% 计算 FFT 并获取频谱特性
X_k3 = T3 * fft(x_n3, N3);
f3 = (0:N3-1) * (Fs3 / N3);

% 绘制时域采样信号
subplot(3, 2, 5);
stem(n3, x_n3, '.');
axis([0, N3, -100, 200]);
title('(a) Fs=300Hz');
xlabel('n');
ylabel('x_a(n)');

% 绘制频域幅频特性
subplot(3, 2, 6);
plot(f3, abs(X_k3));
axis([0, Fs3, 0, 1]);
title('(a) T*FT[x_a(nT)], Fs=300Hz');
xlabel('f(Hz)');
ylabel('幅度');