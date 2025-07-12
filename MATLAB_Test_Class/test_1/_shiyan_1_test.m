t=-10:0.001:10;
t1=0:0.001:10;
t2=-10:0.001:10;
f1=sin(t)./t;%sa(t)函数
f2=rectpuls(t2,2);
f3=5*exp(0.5*t1).*sin(2*pi*t1);

subplot(3,2,1);
plot(t,f1);
title("Sa函数");
xlabel("t");
ylabel("sin(t)/t");
grid on;

subplot(3,2,2);
plot(t2,f2);
title("门函数");
xlabel("t");
ylabel("g2(t)");
grid on;

subplot(3,2,3);
plot(t1,f3);
title("复杂的函数");
xlabel("t");
ylabel("5*exp(0.5*t1).*sin(2*pi*t1)");
grid on;

%门序列
subplot(3,2,4)
k=-5:5;
x=[0 0 0 1 1 1 1 1 0 0 0];
stem(k,x)

%冲激序列
subplot(3,2,5)
n=-5:5;
m = (n==0);
stem(n,m)

% T=5;
% k2=-5:5;
% g4=rectpuls(k2,T);
% stem(k2,g4);

%一个很复杂的东西
subplot(3,2,6)
k2=0:60;
f=1.1.^k2.*sin(0.05*pi*k2);
stem(k2,f);
