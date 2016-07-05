function xdot = simSystem(t,x)

global L2 L3
global p s from_to T Tstart Tend L2 L3

q1=x(1); q2=x(2); q3=x(3); q4=x(4); q5=x(5);

% x=-(L2*sin(q2)+L3*sin(q2+q3))*cos(q1);
% y=-(L2*sin(q2)+L3*sin(q2+q3))*sin(q1);
% z=-L1-L2*cos(q2)-L3*cos(q2+q3);
% dx = (L2*sin(q2)+L3*sin(q2+q3))*sin(q1)*dq1 ...
%       -(L2*cos(q2)+L3*cos(q2+q3))*cos(q1)*dq2 ...
%                   -L3*cos(q2+q3)*cos(q1)*dq3;
% dy = -(L2*sin(q2)+L3*sin(q2+q3))*cos(q1)*dq1 ...
%      -(L2*cos(q2)+L3*cos(q2+q3))*sin(q1)*dq2 ...
%                 -(L3*cos(q2+q3))*sin(q1)*dq3;
% dz =                                   0*dq1 ...
%               (L2*sin(q2)+L3*sin(q2+q3))*dq2 ...
%                            L3*sin(q2+q3)*dq3;

J = [(L2*sin(q2)+L3*sin(q2+q3))*sin(q1), -(L2*cos(q2)+L3*cos(q2+q3))*cos(q1), -L3*cos(q2+q3)*cos(q1);...
     -(L2*sin(q2)+L3*sin(q2+q3))*cos(q1),-(L2*cos(q2)+L3*cos(q2+q3))*sin(q1), -(L3*cos(q2+q3))*sin(q1);...
     0, (L2*sin(q2)+L3*sin(q2+q3)),L3*sin(q2+q3)];
 
[v,dzAlpha,dzBeta] = xdotref(t);

dq = J\v;

dq1=dq(1); dq2=dq(2); dq3=dq(3); 
invKinCalc
dq(4)=dq4; dq(5)=dq5;
if 0%t<T(1)
    display(['t=' num2str(t) ', z=' num2str(z') ', zAlpha=' num2str(zAlpha) ', zBeta=' num2str(zBeta) ', da17=' num2str(da17) ', da18=' num2str(da18) ',dq4=' num2str(dq4) ', dq5=' num2str(dq5)]);
end
xdot=dq;