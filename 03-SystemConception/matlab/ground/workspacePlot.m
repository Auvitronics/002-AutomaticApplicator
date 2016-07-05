% close all;
% plotsel=0;
% for L2=0.02:0.04:0.98
%     L3=1-L2;
%     plotsel=plotsel+1;
%     for q2=-pi/2:0.01:pi/2; 
%         q3=0:0.01:pi;
%         subplot(5,5,plotsel);
%         plot(L2*sin(q2)+L3*sin(q2+q3),L2*cos(q2)+L3*cos(q2+q3)); 
%         hold on;
%     end
%     axis equal
%     title(['L2=' num2str(L2) ' L3=' num2str(L3)]);
% end

d = 1.5*0.3048; % distance between worspace and base link
x = 5*0.3048; y = 4*0.3048; z = 3*0.3048; % workspace specs
l = ((x/2)^2+(d+y)^2)^.5-d; % length of longest cross section to cover
L2plusL3=((d+l)^2+(z/2)^2)/(d+l); % optimum link lengths total
L2plusL3 = 1.25*L2plusL3; %margin to avoid collision
L2=0.5*L2plusL3;
L3=L2plusL3-L2;
for q2=-pi/2:0.01:pi/2; 
    q3=0:0.01:pi;
    plot(L2*sin(q2)+L3*sin(q2+q3),L2*cos(q2)+L3*cos(q2+q3)); 
    hold on;
end
plot([d;d+l;d+l;d;d],[z/2;z/2;-z/2;-z/2;z/2],'r');
axis equal
title(['L2=' num2str(L2) ' L3=' num2str(L3)]);
