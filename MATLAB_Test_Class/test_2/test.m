%第一题 一小问
figure(1)
subplot(3,1,1);
a1=[3,4,1];
b1=[1,1];
n1=0:20;
x1=(n1==0);
h1=filter(b1,a1,x1);
stem(n1,h1,"R");
grid on;

%第一题 二小问
subplot(3,1,2);
a2=[2.5,6,10];
b2=[1];
impz(b2,a2,30);
grid on;

%第二题
nx=-1:6;
nh=-1:11;
x=uDT(nx) - uDT(nx-5);
h=(7/8).^nh.*(uDT(nh)-uDT(nh-10));
y1=conv(x,h);
ny1=nx(1)+nh(1);
ny2=nx(end)+nh(end);
ny=ny1:ny2;
subplot(3,1,3);
stem(ny,y1,"R");
grid on;

%第三题
figure(2)
subplot(2,2,1);
B=imread("lena.bmp");
imshow(B);
Gx=[-1 0 1;-2 0 2;-1 0 1];
Gy=[1 2 1;0 0 0;-1 -2 -1];
%①
subplot(2,2,2);
C1=conv2(Gx,B);
imshow(C1);
%②
subplot(2,2,3);
C2=conv2(Gy,B);
imshow(C2);
%③
subplot(2,2,4);
C3=conv2(C1,Gy);
imshow(C3);

%思考题一
xn=[3,11,7,0,-1,4,2];
hn=[2,3,0,-5,2,1];
yn=conv(xn,hn);
nx_1=-3:3;
nh_1=-1:4;
n_y1=nx_1(1)+nh_1(1);
n_y2=nx_1(end)+nh_1(end);
n_y=n_y1:n_y2;
figure(3);
stem(n_y,yn,"R");
grid on;

%思考题二
% 读取 Lena 图像或其他图像
I = imread("lena.bmp");  

% 转换为灰度图像（如果图像是彩色的）
I_gray =  im2gray(I);

% 使用 Canny 算法进行边缘检测
edges = edge(I_gray, "Canny");

% 显示原图和边缘检测后的图像
figure(4);
subplot(1,2,1);
imshow(I_gray);
title("原图");

subplot(1,2,2);
imshow(edges);
title("Canny 边缘检测结果");
