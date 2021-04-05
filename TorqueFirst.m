%The deck is in contact with the water for the first time at an angle of 48.902
syms x y z
A=20;
B=5.5;
H=0.15;
% for c=0:0.01:0.15
c=0.0507202%0.0507464  %0.0507424;
a=(H-c)./(sqrt(H./A));
tx1=(a-sqrt(a.*a+4*A.*c))./(2*A);
ty=sqrt((a.*x+c-A.*x.^2)./B);
f1=int(1,y,-ty,ty);
f2=int(f1,z,A.*x.^2,a.*x+c);
f3=int(f2,x,tx1,sqrt(H./A));
vpa(f3)
% f1=int(1,y,-u,u);
% f2=int(f1,z,A*x.^2,a.*x+c);
% f3=int(f2,x,tx1,sqrt(H./A));
% vpa(f3)


% if abs(f3-0.0009902)<0.0000001
%     c
%     break
% end
% end