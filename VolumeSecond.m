%Torque of second contact with water
close all;clear all;clc
syms x z y
A=20;
H=0.15;
B=5.5;
%gravity
Xcom=0;
Zcom=0.077;%0.0702;
m=0.9785;
Fg=m*10;
% for c=0.2:0.001:0.3
c=0.1273178;
j=165.324;
a=tan(j/180*pi);
tx=(sqrt(a.*a+4*A.*c)+a)./(2*A);
u=sqrt((H-A*x*x)./B);

f1=int(1,z,a.*x+c,H);%volume on the left
f2=int(f1,y,-u,u);
f3=int(f2,x,-sqrt(H./A),tx);
fx1=int(x,z,a.*x+c,H);%x on the left
fx2=int(fx1,y,-u,u);
fx3=int(fx2,x,-sqrt(H./A),tx);
fx=fx3./f3;
%vpa(fx)
fz1=int(z,z,a.*x+c,H);%z on the left
fz2=int(fz1,y,-u,u);
fz3=int(fz2,x,-sqrt(H./A),tx);
fz=fz3./f3;
%vpa(fz)

q1=int(1,z,A*x.^2+B*y.^2,H);%volume on the right
q2=int(q1,y,-u,u);
q3=int(q2,x,tx,sqrt(H./A));
qx1=int(x,z,A*x.^2+B*y.^2,H);%x on the right
qx2=int(qx1,y,-u,u);
qx3=int(qx2,x,tx,sqrt(H./A));
qx=qx3./q3
%vpa(qx)
qz1=int(z,z,A*x.^2+B*y.^2,H);%z on the right
qz2=int(qz1,y,-u,u);
qz3=int(qz2,x,tx,sqrt(H./A));
qz=qz3./q3
%vpa(qz)
%floating
Xcob=(fx.*f3+qx.*q3)./(f3+q3)
vpa(Xcob)
Zcob=(fz.*f3+qz.*q3)./(f3+q3)
vpa(Zcob)
%torque
ll=2*Fg*sin(j/180*pi)*(Zcob-Zcom)+2*Fg*cos(j/180*pi)*Xcob
vpa(ll)