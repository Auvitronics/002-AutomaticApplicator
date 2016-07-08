function q=invGeomPosition(x)

global L1 L2 L3

q=zeros(3,1);

% xInit = p(1,:)'+[d+yW/2;0;0];
q(1) = atan2(x(2),x(1));
r = (x(1)^2+x(2)^2+x(3)^2)^.5;
% r^2 = L2^2+L3^2-2*L2*L3*cos(pi-q3Init)
q(3) =  acos(-(L2^2+L3^2-r^2)/(2*L2*L3));
rXY = (x(1)^2+x(2)^2)^.5;
% L2*sin(q2)+L3*sin(q2+q3) = rXY
% sin(q2)*(L2+L3*cos(q3))+cos(q2)*L3*sin(q3) = rXY
% sin(q2+alpha)=rXZ/((L2+L3*cos(q3))^2+(L3*sin(q3))^2)^.5 where alpha=atan2(L3*sin(q3),L2+L3*cos(q3))
q(2) = asin(rXY/((L2+L3*cos(q(3)))^2+(L3*sin(q(3)))^2)^.5) - atan2(L3*sin(q(3)),L2+L3*cos(q(3)));