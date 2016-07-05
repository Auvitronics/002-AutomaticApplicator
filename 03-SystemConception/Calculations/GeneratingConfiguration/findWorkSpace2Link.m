function findWorkSpace2Link(l1,l2,bx,varargin)

if nargin>3
    by=varargin{1};
else
    by=0;
end

x=[];y=[];
for th1=-pi/2:5*pi/180:pi/2
    for th2=-pi:5*pi/180:pi
        x=[x;l1*cos(th1)+l2*cos(th2)];
        y=[y;-l1*sin(th1)-l2*sin(th2)];
    end
end

plot(y,x)
hold on
plot([by+2.5;by+2.5;by-2.5;by-2.5;by+2.5],[bx+2;bx-2;bx-2;bx+2;bx+2],'r')
axis equal