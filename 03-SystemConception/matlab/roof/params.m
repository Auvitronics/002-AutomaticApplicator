global p s from_to T Tstart Tend L1 L2 L3 alpha z5Dir

R = 0.4147 ; % wheel radius
R1=2*0.075;
R2=2*0.05;
R3=2*0.04;
R4=2*0.03;
R5=2.5*0.02;
linkWidth=0.5;
capWidth=0.25;
alpha = atan2(0.0375,0.2*R);
x1 = 1.2*R+(4/3)*(R5+capWidth*R5)*cos(alpha);
z1 = 0.0375+(4/3)*(R5+capWidth*R5)*sin(alpha);
x2 = 0.95*R;
z2 = 0.075+(4/3)*(R5+capWidth*R5);
x3 = 0.2*R;
r1 = 0.9*R;
r2 = 0.25*R;
th0 = pi/8;
th1 = pi/4;
th2 = pi/4;
Tsum = 60;


p(1,:) = [x1 0 z1];
p(2,:) = [x2 0 z2];
p(3,:) = [r1*cos(th0) r1*sin(th0) z2];
p(4,:) = [r2*cos(th0) r2*sin(th0) z2];
p(5,:) = [r2*cos(th0-th1) r2*sin(th0-th1) z2];
p(6,:) = [r1*cos(th0-th1) r1*sin(th0-th1)  z2];
p(7,:) = [r1*cos(th0-th1-th2) r1*sin(th0-th1-th2) z2];
p(8,:) = [r2*cos(th0-th1-th2) r2*sin(th0-th1-th2) z2];
p(9,:) = [r2*cos(th0-2*th1-th2) r2*sin(th0-2*th1-th2) z2];
p(10,:) = [r1*cos(th0-2*th1-th2) r1*sin(th0-2*th1-th2) z2];
p(11,:) = [r1*cos(th0-2*th1-2*th2) r2*sin(th0-2*th1-2*th2) z2];
p(12,:) = [r2*cos(th0-2*th1-2*th2) r2*sin(th0-2*th1-2*th2) z2];
p(13,:) = [r2*cos(th0-3*th1-2*th2) r2*sin(th0-3*th1-2*th2) z2];
p(14,:) = [r1*cos(th0-3*th1-2*th2) r1*sin(th0-3*th1-2*th2) z2];
p(15,:) = [r1*cos(th0-3*th1-3*th2) r1*sin(th0-3*th1-3*th2) z2];
p(16,:) = [r2*cos(th0-3*th1-3*th2) r2*sin(th0-3*th1-3*th2) z2];
p(17,:) = [r2*cos(th0-4*th1-3*th2) r2*sin(th0-4*th1-3*th2) z2];
p(18,:) = [r1*cos(th0-4*th1-3*th2) r1*sin(th0-4*th1-3*th2) z2];
p(19,:) = [x3 0 z2];
p(20,:) = [0 0 z2];

z5Dir(1,:)=([R, 0, 0]-p(1,:))/norm([R,0,0]-p(1,:));
% z5Dir(2,:)=([R, 0, 0]-p(1,:))/norm([R,0,0]-p(1,:));
z5Dir(2:20,:)=[zeros(19,2) -ones(19,1)];


s(1) = 2*pi*x1;                  from_to(1:2,1)=[1; 1];
s(2) = norm(p(1,:)-p(2,:));      from_to(1:2,2)=[1; 2];
s(3) = 2*pi*x2;                  from_to(1:2,3)=[2; 2];
s(4) = norm(p(2,:)-p(3,:));      from_to(1:2,4)=[2; 3];
s(5:2:19) = r1-r2;               from_to(1:2,5:2:19)=[3:2:17; 4:2:18];
s(6:4:18) = norm(p(4,:)-p(5,:)); from_to(1:2,6:4:18)=[4:4:16; 5:4:17];
s(8:4:16) = norm(p(6,:)-p(7,:)); from_to(1:2,8:4:16)=[6:4:14; 7:4:15];
s(20) = norm(p(18,:)-p(19,:));   from_to(1:2,20)=[18; 19];
s(21) = 2*pi*x3;                 from_to(1:2,21)=[19; 19];
s(22) = norm(p(19,:)-p(20,:));   from_to(1:2,22)=[19; 20];
s(23) = norm(p(20,:)-p(1,:));    from_to(1:2,23)=[20; 1];
sSum = sum(s);
T=Tsum*s/sSum;

Tstart(1)=0;
for i=1:length(T)-1; 
    Tstart(i+1)=sum(T(1:i)); 
    Tend(i)=sum(T(1:i)); 
end
Tend(length(T))=sum(T);

L1 = 1;
L3 = 1.0467;
L2 = 1.147; 
xW=0.3048*4;
yW=0.3048*5;
zW=0.3048*3;

basePos=L1+((L2+L3)^2-(0.5*(xW^2+yW^2)^0.5)^2)^0.5-zW;