function xdot = simSystem(t,x)

global L2 L3
global p s from_to T Tstart Tend L2 L3

q1=x(1); q2=x(2); q3=x(3); q4=x(4); q5=x(5);

% x=(L2*sin(q2)+L3*sin(q2+q3))*cos(q1);
% y=(L2*sin(q2)+L3*sin(q2+q3))*sin(q1);
% z=L2*cos(q2)+L3*cos(q2+q3);
% dx = -(L2*sin(q2)+L3*sin(q2+q3))*sin(q1)*dq1 ...
%       (L2*cos(q2)+L3*cos(q2+q3))*cos(q1)*dq2 ...
%                    L3*cos(q2+q3)*cos(q1)*dq3;
% dy =  (L2*sin(q2)+L3*sin(q2+q3))*cos(q1)*dq1 ...
%     + (L2*cos(q2)+L3*cos(q2+q3))*sin(q1)*dq2 ...
%                + (L3*cos(q2+q3))*sin(q1)*dq3;
% dz =                                   0*dq1 ...
%             - (L2*sin(q2)+L3*sin(q2+q3))*dq2 ...
%                           -L3*sin(q2+q3)*dq3;

J = [-(L2*sin(q2)+L3*sin(q2+q3))*sin(q1), (L2*cos(q2)+L3*cos(q2+q3))*cos(q1), L3*cos(q2+q3)*cos(q1);...
     (L2*sin(q2)+L3*sin(q2+q3))*cos(q1),(L2*cos(q2)+L3*cos(q2+q3))*sin(q1), (L3*cos(q2+q3))*sin(q1);...
     0, -(L2*sin(q2)+L3*sin(q2+q3)),-L3*sin(q2+q3)];
 
[v,w] = xdotref(t);

dq = J\v;

% % % % % % % % % % % w5 =
% % % % % % % % % % %  
% % % % % % % % % % %  dq2*cos(pi/2 + q1) + dq3*cos(pi/2 + q1) + dq5*cos(pi/2 + q1)
% % % % % % % % % % %  dq2*sin(pi/2 + q1) + dq3*sin(pi/2 + q1) + dq5*sin(pi/2 + q1)
% % % % % % % % % % %                                                     dq1 + dq4
% % % % % % % % % % 
% % % % % % % % % % %  w(1) = (dq2 + dq3 + dq5)*cos(pi/2 + q1)
% % % % % % % % % % %  w(2) = (dq2 + dq3 + dq5)*sin(pi/2 + q1)
% % % % % % % % % % %  (dq2 + dq3 + dq5)^2=w(1)^2+w(2)^2
% % % % % % % % % % dq5_(1) = (w(1)^2+w(2)^2)^.5-dq(2)-dq(3);
% % % % % % % % % % dq5_(2) = -(w(1)^2+w(2)^2)^.5-dq(2)-dq(3);
% % % % % % % % % % dq(4) = w(3)-dq(1);
% % % % % % % % % % 
% % % % % % % % % % wNew = [(dq(2)+dq(3)+dq5_)*cos(pi/2+q1);(dq(2)+dq(3)+dq5_)*sin(pi/2+q1);dq(1)+dq(4),dq(1)+dq(4)];
% % % % % % % % % % for i=1:length(dq5_)
% % % % % % % % % %     n(i)=norm(w-wNew(:,i));
% % % % % % % % % % end
% % % % % % % % % % [val,ind]=min(n);
% % % % % % % % % % dq(5)=dq5_(ind);
% % % % % % % % % % 
% % % % % % % % % % xdot=dq;

% w5 =
%  
%  dq5*(cos(pi/2 + q1)*cos(q4 - pi/2) + sin(q4 - pi/2)*(sin(q2)*sin(q3)*sin(pi/2 + q1) - cos(q2)*cos(q3)*sin(pi/2 + q1))) + dq4*(cos(q2)*sin(q3)*sin(pi/2 + q1) + cos(q3)*sin(q2)*sin(pi/2 + q1)) + dq2*cos(pi/2 + q1) + dq3*cos(pi/2 + q1)
%  dq5*(cos(q4 - pi/2)*sin(pi/2 + q1) - sin(q4 - pi/2)*(cos(pi/2 + q1)*sin(q2)*sin(q3) - cos(q2)*cos(q3)*cos(pi/2 + q1))) - dq4*(cos(q2)*cos(pi/2 + q1)*sin(q3) + cos(q3)*cos(pi/2 + q1)*sin(q2)) + dq2*sin(pi/2 + q1) + dq3*sin(pi/2 + q1)
%                                                                                                                                    dq1 + dq4*(cos(q2)*cos(q3) - sin(q2)*sin(q3)) + dq5*sin(q4 - pi/2)*(cos(q2)*sin(q3) + cos(q3)*sin(q2))

if(t<(T(1)+T(2)) && t>T(1)); debug=1; else debug=0; end;
dq1=dq(1); dq2=dq(2); dq3=dq(3); 
wx=w(1); wy=w(2); wz=w(3);
dqcoeffs 
if (abs(det(a))<1e-3)
    J=[a(2,1) a(2,2)];
    dq45=[2,0,J(1);0,2,J(2);J(1),J(2),0]\[0;0;wz-b(2)];
    if(debug)
        display(['singularity @ t=' num2str(t) ', w=[' num2str(w') '], dq45=[' num2str(dq45') ']']);
    end
else
    dq45=(aa'*aa)\(aa'*(w-bb));dq4=dq45(1);dq5=dq45(2);
    if(debug)
        w5New =[dq5*(cos(pi/2 + q1)*cos(q4 - pi/2) + sin(q4 - pi/2)*(sin(q2)*sin(q3)*sin(pi/2 + q1) - cos(q2)*cos(q3)*sin(pi/2 + q1))) + dq4*(cos(q2)*sin(q3)*sin(pi/2 + q1) + cos(q3)*sin(q2)*sin(pi/2 + q1)) + dq2*cos(pi/2 + q1) + dq3*cos(pi/2 + q1);...
           dq5*(cos(q4 - pi/2)*sin(pi/2 + q1) - sin(q4 - pi/2)*(cos(pi/2 + q1)*sin(q2)*sin(q3) - cos(q2)*cos(q3)*cos(pi/2 + q1))) - dq4*(cos(q2)*cos(pi/2 + q1)*sin(q3) + cos(q3)*cos(pi/2 + q1)*sin(q2)) + dq2*sin(pi/2 + q1) + dq3*sin(pi/2 + q1);...
           dq1 + dq4*(cos(q2)*cos(q3) - sin(q2)*sin(q3)) + dq5*sin(q4 - pi/2)*(cos(q2)*sin(q3) + cos(q3)*sin(q2))];

        display(['NO singularity @ t=' num2str(t) ', w=[' num2str(w') '], dq45=[' num2str(dq45') '], w5New=[' num2str(w5New') ']']);
    end
end
dq(4)=dq45(1); dq(5)=dq45(2);
xdot=dq;