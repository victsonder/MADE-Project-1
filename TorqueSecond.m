%The deck is in contact with the water for the second time at an angle of 165.324
syms x y z
A=20;
B=5.5;
H=0.15;
c=0.1273178;
a=(c-H)./(sqrt(H./A));
tx=(sqrt(a.*a+4*A.*c)+a)./(2*A);
u=sqrt((H-A*x*x)./B);
f1=int(1,z,a.*x+c,H);%Volume on the left
f2=int(f1,y,-u,u);
f3=int(f2,x,-sqrt(H./A),tx);
q1=int(1,z,A*x.^2+B*y.^2,H);%Volume on the right
q2=int(q1,y,-u,u);
q3=int(q2,x,tx,sqrt(H./A));
vpa(f3+q3)