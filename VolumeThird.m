%The center of floating before touching the deck
close all;clear all;clc
syms x z y
A=20;
H=0.15;
B=5.5;
%gravity
Xcom=0;
Zcom=0.072;%0.0746;
m=0.9785;
Fg=m*10;
% for c=0.2:0.001:0.3
c=0.057197;
j=40;
a=tan(j/180*pi);
u=sqrt((H-A*x*x)./B);
tx1=(a-sqrt(a.*a+4*A.*c))./(2*A);
tx2=(a+sqrt(a.*a+4*A.*c))./(2*A);
ty=sqrt((a.*x+c-A.*x.^2)./B);
f1=int(1,y,-ty,ty);
f2=int(f1,z,A.*x.^2,a.*x+c);
f3=int(f2,x,tx1,tx2);

f1x=int(x,y,-ty,ty);
f2x=int(f1x,z,A.*x.^2,a.*x+c);
f3x=int(f2x,x,tx1,tx2);
Xcob=vpa(f3x./f3)

f1z=int(z,y,-ty,ty);
f2z=int(f1z,z,A.*x.^2,a.*x+c);
f3z=int(f2z,x,tx1,tx2);
Zcob=vpa(f3z./f3)
ll=2*Fg*sin(j/180*pi)*(Zcob-Zcom)+2*Fg*cos(j/180*pi)*Xcob
vpa(ll)
