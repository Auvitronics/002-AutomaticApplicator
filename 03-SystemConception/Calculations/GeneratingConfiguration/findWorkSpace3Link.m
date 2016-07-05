function findWorkSpace3Link(l1,l2,bx,varargin)

by=0; bz=1.5;
if nargin>3
    by=varargin{1};
end
if nargin>4
    bz=varargin{2};
end

syms q1 q2 q3 real

x1=[cos(q1);0;sin(q1)]; y1=[0;1;0]; z1=[-sin(q1);0;cos(q1)]; P1=[0;0;0]; A1=[x1 y1 z1]; T1=[A1 P1;0 0 0 1];
x2=[cos(q2);sin(q2);0]; y2=[-sin(q2);cos(q2);0]; z2=[0;0;1]; P2=[0;0;0]; A2=[x2 y2 z2]; T2=[A2 P2;0 0 0 1];
x3=[cos(q3);sin(q3);0]; y3=[-sin(q3);cos(q3);0]; z3=[0;0;1]; P3=[l1;0;0]; A3=[x3 y3 z3]; T3=[A3 P3;0 0 0 1];
P4=[l2;0;0];

P4in0=T1*T2*T3*[P4;1];
P4in0=P4in0(1:3);
PP=matlabFunction(P4in0);

x=[];y=[]; z=[];
for th1=-15*pi/180:5*pi/180:60*pi/180
    for th2=-pi/2:5*pi/180:pi/2
        for th3=-pi:5*pi/180:pi
            P = PP(th1,th2,th3);
            x=[x; P(1)]; y=[y; P(2)]; z=[z; P(3)];
        end
    end
end

l=2.5;h=1.5;
box_x=[bx+2;bx-2;bx-2;bx+2;bx+2; bx+2;bx-2;bx-2;bx+2;bx+2; bx-2;bx-2; bx-2;bx-2; bx+2;bx+2];
box_y=[by+l;by+l;by-l;by-l;by+l; by+l;by+l;by-l;by-l;by+l; by+l;by+l; by-l;by-l; by-l;by-l];
box_z=-[bz+h;bz+h;bz+h;bz+h;bz+h; bz-h;bz-h;bz-h;bz-h;bz-h; bz-h;bz+h; bz+h;bz-h; bz-h;bz+h];

subplot(221)
plot3(x,y,-z)
hold on
plot3(box_x,box_y,box_z,'r');

subplot(222)
plot3(x,y,-z)
hold on
plot3(box_x,box_y,box_z,'r');
view(0,90);
axis equal

subplot(223)
plot3(x,y,-z)
hold on
plot3(box_x,box_y,box_z,'r');
view(0,0);
axis equal

subplot(224)
plot3(x,y,-z)
hold on
plot3(box_x,box_y,box_z,'r');
view(90,0);
axis equal