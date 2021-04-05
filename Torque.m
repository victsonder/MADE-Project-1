%Volume of water near AVS%Determine the value of c
% 0.001013
close all;clear all;clc
syms x z y c
A=20;
H=0.15;
B=5.5;
%for c=0.08:0.001:0.3%c=0.098;
c=0.127181;
j=159;
a=tan(j/180*pi);
tx=(sqrt(a.*a+4*A.*c)+a)./(2*A);
u=sqrt((H-A*x*x)./B);
f1=int(1,z,a.*x+c,H);%Volume on the left
f2=int(f1,y,-u,u);
f3=int(f2,x,(H-c)./a,tx);
q1=int(1,z,A*x.^2+B*y.^2,H);%Volume on the right
q2=int(q1,y,-u,u);
q3=int(q2,x,tx,sqrt(H./A));
vpa(f3+q3)
%     if abs(f3+q3-0.0009902)< 0.000001
%         c
%         break
%     end
% end