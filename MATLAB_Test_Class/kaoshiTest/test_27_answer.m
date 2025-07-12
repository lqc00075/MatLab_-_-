[xn, fs] = audioread('motherland.wav');
D = 3;

yn1 = xn(1:D:end); 

wp = pi/D - 0.05*pi;
ws = pi/D + 0.05*pi;
Rp = 1;
As = 30;
Fs = 100;
[bd, ad] = low_pass_filter(wp, ws, Rp, As, Fs);

xn_filtered = filter(bd, ad, xn);
yn2 = xn_filtered(1:D:end);

figure;
subplot(411);
Nfft = 1024;
[h, w] = freqz(bd, ad, 'whole', Fs);
plot(w, abs(h));
title('滤波器的幅频特性');
ylabel('幅值');
xlabel('频率（f）');

subplot(412);
[h, w] = freqz(bd, ad, 'whole', Fs);
plot(w, unwrap(angle(h))/pi);
title('滤波器的相频特性');
ylabel('相位');
xlabel('频率（f）');

subplot(413);
xn1 = 1/(fs/D) * fft(yn2(8000/D:8100/D), Nfft);
f_downsampled = (0:Nfft/2-1) * fs/(Nfft*D);
plot(f_downsampled, abs(xn1(1:Nfft/2)));
title('经过滤波抽取模拟域幅度谱');
xlabel('频率(f)');

subplot(414);
xn1 = 1/(fs/D) * fft(yn2(8000/D:8100/D), Nfft);
f_downsampled = (0:Nfft/2-1) * fs/(Nfft*D);
plot(f_downsampled, angle(xn1(1:Nfft/2)));
title('经过滤波抽取后模拟域相位谱');
xlabel('频率(f)');



function [bd, ad] = low_pass_filter(wp, ws, Rp, As, Fs)
    ripple = 10^(-Rp/20);
    Attn = 10^(-As/20);
    T = 1/Fs;
    Omgp = wp*Fs;
    Omgs = ws*Fs;

    [n, Omgc] = buttord(Omgp, Omgs, Rp, As, 's');
    [z0, p0, k0] = buttap(n);
    ba1 = k0 * real(poly(z0));
    aa1 = real(poly(p0));
    [ba, aa] = lp2lp(ba1, aa1, Omgc);
    [bd, ad] = impinvar(ba, aa, Fs);
end
