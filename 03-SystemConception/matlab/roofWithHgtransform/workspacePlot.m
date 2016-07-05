close all;
L3=1.0467;
L2=1.147; 
% L2=0.82676; L3=1.1692;
% L2=0.8157; L3=1.1536;
c=((L2+L3)^2-(0.5*a)^2)^0.5; 
for q2=-pi/2:0.01:pi/2; 
    q3=-q2-pi/2:0.01:-q2+pi/2;
    plot(L2*sin(q2)+L3*sin(q2+q3),L2*cos(q2)+L3*cos(q2+q3)); 
    hold on;
end;
plot([0.5*a;0.5*a;-0.5*a;-0.5*a;0.5*a],[c;c-b;c-b;c;c],'r');
axis equal