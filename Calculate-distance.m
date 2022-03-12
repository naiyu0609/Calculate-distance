clc,clear;
%initial
disp('initial')
tic%計時開始

K=[1308.36 0 780;
   0 1308.36 480.5;
   0 0 1];%Intrinsic parameter
K_inv=inv(K);

eye=[-4.5 -2.5 130 1]';%right eye ball of Santa Claus

X1=[-10 50 0 1]';%coordinate in 3D world
X2=[0 50 100 1]';
X3=[-100 50 100 1]';
X4=[50 -80 0 1]';
X5=[50 -50 50 1]';
X6=[50 -100 50 1]';
X7=[100 -50 50 1]';

uv1=[641 672 1]';%coordinate in image
uv2=[671 295 1]';
uv3=[232 419 1]';
uv4=[1224 842 1]';
uv5=[1150 598 1]';
uv6=[1372 710 1]';
uv7=[1262 525 1]';

zero=[0 0 0 0]';

Puvmatrix=[X1' zero' -uv1(1).*X1';
           zero' X1' -uv1(2).*X1';
           X2' zero' -uv2(1).*X2';
           zero' X2' -uv2(2).*X2';
           X3' zero' -uv3(1).*X3';
           zero' X3' -uv3(2).*X3';
           X4' zero' -uv4(1).*X4';
           zero' X4' -uv4(2).*X4';
           X5' zero' -uv5(1).*X5';
           zero' X5' -uv5(2).*X5';
           X6' zero' -uv6(1).*X6';
           zero' X6' -uv6(2).*X6';
           X7' zero' -uv7(1).*X7';
           zero' X7' -uv7(2).*X7'];


%%
%calculate
clc
disp('calculate')
[U,S,V]=svd(Puvmatrix);%用SVD解
P=[transpose(V(1:4,12));
   transpose(V(5:8,12));
   transpose(V(9:12,12))];%未正規化
P=P/P(3,4);%正規化
RT=K_inv*P;%計算extrinsic parameters
RT=RT/sqrt(RT(1,1)^2+RT(2,1)^2+RT(3,1)^2);%將vector變成unit
obj_in_camera=[RT;0 0 0 1]*eye;%將目標座標世界轉換到相機座標世界(相機為(0,0,0))
obj_in_camera=obj_in_camera/obj_in_camera(4);%正規化
len=sqrt(obj_in_camera(1)^2+obj_in_camera(2)^2+obj_in_camera(3)^2);%利用座標計算長度


%%
%finish
clc
disp(['length = ' num2str(len)])
disp('finish')
toc