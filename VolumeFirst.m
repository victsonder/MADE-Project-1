%The center of floating that first touches the surface of the water
close all;clear all;clc
syms x z y
A=20;
H=0.15;
B=5.5;
%gravity
Xcom=0;
Zcom=0.0702;
m=1.013;
Fg=m*10;
% for c=0.2:0.001:0.3
c=0.0507202;
j=48.902;
a=tan(j/180*pi);
tx1=(a-sqrt(a.*a+4*A.*c))./(2*A);
ty=sqrt((a.*x+c-A.*x.^2)./B);
f1=int(1,y,-ty,ty);
f2=int(f1,z,A.*x.^2,a.*x+c);
f3=int(f2,x,tx1,sqrt(H./A));

f1x=int(x,y,-ty,ty);
f2x=int(f1x,z,A.*x.^2,a.*x+c);
f3x=int(f2x,x,tx1,sqrt(H./A));
Xcob=vpa(f3x./f3)

f1z=int(z,y,-ty,ty);
f2z=int(f1z,z,A.*x.^2,a.*x+c);
f3z=int(f2z,x,tx1,sqrt(H./A));
Zcob=vpa(f3z./f3)
ll=2*Fg*sin(j/180*pi)*(Zcob-Zcom)+2*Fg*cos(j/180*pi)*Xcob
vpa(ll)
