function [qq4,qq5]=invGeomOrientation(z,q1,q2,q3)


% A0=eye(3); P0=[0 0 -L1]'; T0=[A0, P0; [0 0 0 1]];
% A1=[[cos(q1+pi/2) sin(q1+pi/2) 0]',[-sin(q1+pi/2) cos(q1+pi/2) 0]',[0 0 1]']; P1=[0 0 L1/2]';    T1=T0*[A1, P1; [0 0 0 1]];
% A2=[[1 0 0]',[0 cos(q2) sin(q2)]',[0 -sin(q2) cos(q2)]']; P2=[0 0 L1/2]';                        T2=T1*[A2, P2; [0 0 0 1]];
% A3=[[1 0 0]',[0 cos(q3) sin(q3)]',[0 -sin(q3) cos(q3)]']; P3=[0 0 L2]';                          T3=T2*[A3, P3; [0 0 0 1]];
% A4=[[cos(q4-pi/2) sin(q4-pi/2) 0]',[-sin(q4-pi/2) cos(q4-pi/2) 0]',[0 0 1]']; P4=[0 0 0.7*L3]';    T4=T3*[A4, P4; [0 0 0 1]];
% A5=[[1 0 0]',[0 cos(q5) sin(q5)]',[0 -sin(q5) cos(q5)]']; P5=[0 0 0.3*L3]';                        T5=T4*[A5, P5; [0 0 0 1]];
% 
% z=T5(1:3,1:3)*[0 0 1]';
% zx= cos(q4)*sin(q1)*sin(q5) + cos(q1)*cos(q2)*cos(q5)*sin(q3) + cos(q1)*cos(q3)*cos(q5)*sin(q2) + cos(q1)*cos(q2)*cos(q3)*sin(q4)*sin(q5) - cos(q1)*sin(q2)*sin(q3)*sin(q4)*sin(q5)
% zy= cos(q2)*cos(q5)*sin(q1)*sin(q3) - cos(q1)*cos(q4)*sin(q5) + cos(q3)*cos(q5)*sin(q1)*sin(q2) + cos(q2)*cos(q3)*sin(q1)*sin(q4)*sin(q5) - sin(q1)*sin(q2)*sin(q3)*sin(q4)*sin(q5)
% zz=                                                           cos(q2)*cos(q3)*cos(q5) - cos(q5)*sin(q2)*sin(q3) - cos(q2)*sin(q3)*sin(q4)*sin(q5) - cos(q3)*sin(q2)*sin(q4)*sin(q5)
%
% zx = sin(q1)*cos(q4)*sin(q5) ...
%    + (cos(q1)*cos(q2)*sin(q3) + cos(q1)*cos(q3)*sin(q2))*cos(q5) ...
%    + (cos(q1)*cos(q2)*cos(q3) - cos(q1)*sin(q2)*sin(q3))*sin(q4)*sin(q5)
% zz = (cos(q2)*cos(q3) - sin(q2)*sin(q3))*cos(q5) ...
%        + (-cos(q2)*sin(q3)-cos(q3)*sin(q2))*sin(q4)*sin(q5)
%
% zx = a*cos(q4)*sin(q5) + d*cos(q5) + e*sin(q4)*sin(q5)
% zz = b*cos(q5) + c*sin(q4)*sin(q5)

z=z(:);
zx=z(1); 
zy=z(2); 
zz=z(3);
a = sin(q1); 
d = cos(q1)*cos(q2)*sin(q3) + cos(q1)*cos(q3)*sin(q2);
e = cos(q1)*cos(q2)*cos(q3) - cos(q1)*sin(q2)*sin(q3);
b = cos(q2)*cos(q3) - sin(q2)*sin(q3);
c = -cos(q2)*sin(q3)-cos(q3)*sin(q2);


if a~=0
    f = zx*c/a-zz*e/a; g=-c*d/a+e*b/a;
    A = b^c+c^2+g^2; B=2*(f*g-zz*b); C=f^2+zz^2-c^2;
    quadSol=[(-B+(B^2-4*A*C)^.5)/(2*A),(-B-(B^2-4*A*C)^.5)/(2*A)];
    q5([1 3]) = acos(quadSol); q5([2 4]) = -q5([1 3]);
else
    q5(1)=acos((e*zz-c*zx)/(e*b-c*d)); q5(2)=-q5(1);
end

q4 = asin((zz-b*cos(q5))./(c*sin(q5))); q4=[q4, pi-q4];
q5 = [q5, q5];

newZ= [cos(q4).*sin(q1).*sin(q5) + cos(q1).*cos(q2).*cos(q5).*sin(q3) + cos(q1).*cos(q3).*cos(q5).*sin(q2) + cos(q1).*cos(q2).*cos(q3).*sin(q4).*sin(q5) - cos(q1).*sin(q2).*sin(q3).*sin(q4).*sin(q5); ...
    cos(q2).*cos(q5).*sin(q1).*sin(q3) - cos(q1).*cos(q4).*sin(q5) + cos(q3).*cos(q5).*sin(q1).*sin(q2) + cos(q2).*cos(q3).*sin(q1).*sin(q4).*sin(q5) - sin(q1).*sin(q2).*sin(q3).*sin(q4).*sin(q5);...
                                                           cos(q2).*cos(q3).*cos(q5) - cos(q5).*sin(q2).*sin(q3) - cos(q2).*sin(q3).*sin(q4).*sin(q5) - cos(q3).*sin(q2).*sin(q4).*sin(q5)];
size(newZ);
for i=1:length(q5)
    n(i)=norm(newZ(:,i)-z);
end
[val,ind]=min(n);
qq4=q4(ind);
qq5=q5(ind);
