%Volume before contacting the deck 0-48.895
syms x y z
A=20;
B=5.5;
H=0.15;
% for c=0:0.01:0.15
%c=0.048216
c=0.057197;
j=40;
a=tan(j/180*pi);
tx1=(a-sqrt(a.*a+4*A.*c))./(2*A);
tx2=(a+sqrt(a.*a+4*A.*c))./(2*A);
ty=sqrt((a.*x+c-A.*x.^2)./B);
f1=int(1,y,-ty,ty);
f2=int(f1,z,A.*x.^2,a.*x+c);
f3=int(f2,x,tx1,tx2);
vpa(f3)