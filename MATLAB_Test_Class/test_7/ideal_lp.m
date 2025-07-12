function hd=ideal_lp(wc,N)%点 0 到 N-1之间的理想脉冲响应
%wc=截止频率(弧度)
%N=理想滤波器的长度
tao=(N-1)/2;
n=0:(N-1);
%加一个小数以避免0作除数
m=n-tao+eps;
hd=sin(wc*m)./(pi*m);