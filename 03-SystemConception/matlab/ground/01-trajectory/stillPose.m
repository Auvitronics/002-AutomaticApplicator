clear all
params 
i = 1;

close all
figure(1);
clf;
[X1,Y1,Z1,C1]=asy1(2*R1,0.67*R1,R1,L1/2);
[X2,Y2,Z2,C2]=asy2(R1,linkWidth*R2,capWidth*R2,R2,L1/2);
[X3,Y3,Z3,C3]=asy3(R2,capWidth*R2,linkWidth*(R2+R3)/2,capWidth*R3,R3,L2); 
[X4,Y4,Z4,C4]=asy4(R3,capWidth*R4,linkWidth*R4,R4,0.7*L3); 
[X5,Y5,Z5,C5]=asy2(R4,linkWidth*R5,capWidth*R5,R5,0.3*L3); 
[X6,Y6,Z6,C6]=asy5(R5,capWidth*R5,linkWidth*R5);

clf;
q1=0; q2=0; q3=0; q4=0; q5=pi/4;

A0=eye(3); P0=[0 0 -L1]'; T0=[A0, P0; [0 0 0 1]];
A1=[[cos(q1+pi/2) sin(q1+pi/2) 0]',[-sin(q1+pi/2) cos(q1+pi/2) 0]',[0 0 1]']; P1=[0 0 L1/2]';    T1=T0*[A1, P1; [0 0 0 1]];
A2=[[1 0 0]',[0 cos(q2) sin(q2)]',[0 -sin(q2) cos(q2)]']; P2=[0 0 L1/2]';                        T2=T1*[A2, P2; [0 0 0 1]];
A3=[[1 0 0]',[0 cos(q3) sin(q3)]',[0 -sin(q3) cos(q3)]']; P3=[0 0 L2]';                          T3=T2*[A3, P3; [0 0 0 1]];
A4=[[cos(q4-pi/2) sin(q4-pi/2) 0]',[-sin(q4-pi/2) cos(q4-pi/2) 0]',[0 0 1]']; P4=[0 0 0.7*L3]';    T4=T3*[A4, P4; [0 0 0 1]];
A5=[[1 0 0]',[0 cos(q5) sin(q5)]',[0 -sin(q5) cos(q5)]']; P5=[0 0 0.3*L3]';                        T5=T4*[A5, P5; [0 0 0 1]];
[X,Y,Z]=transformSurface(X1,Y1,Z1,T0); surf(X,Y,Z,C1,'EdgeColor','none'); hold on;
[X,Y,Z]=transformSurface(X2,Y2,Z2,T1); surf(X,Y,Z,C2,'EdgeColor','none'); hold on;
[X,Y,Z]=transformSurface(X3,Y3,Z3,T2); surf(X,Y,Z,C3,'EdgeColor','none'); hold on;
[X,Y,Z]=transformSurface(X4,Y4,Z4,T3); surf(X,Y,Z,C4,'EdgeColor','none'); hold on;
[X,Y,Z]=transformSurface(X5,Y5,Z5,T4); surf(X,Y,Z,C5,'EdgeColor','none'); hold on;
[X,Y,Z]=transformSurface(X6,Y6,Z6,T5); surf(X,Y,Z,C6,'EdgeColor','none'); hold on;
%     plot3([0; 0; -L2*sin(q2)*cos(q1); -(L2*sin(q2)+L3*sin(q2+q3))*cos(q1)],...
%         -[0; 0; L2*sin(q2)*sin(q1); (L2*sin(q2)+L3*sin(q2+q3))*sin(q1)],...
%         [-L1; 0; L2*cos(q2); L2*cos(q2)+L3*cos(q2+q3)]);
if i==1
    xlabel('X'); ylabel('Y'); zlabel('Z'); 
    grid on; 
    axis equal
    xlims=xlim; ylims=ylim; zlims=zlim;
    maxlim=max(abs([xlims ylims]));
    xlims=[-maxlim maxlim];
    ylims=[-maxlim maxlim];
    axis manual
    [az0,el0]=view;
end

%      view(az,el); zoom(zoomfactor);
xlim(xlims); ylim(ylims); zlim(zlims);
%     campos(camposition);
camlight
% camera_target=T5*[0;0;(4/3)*(R1+R2);1];
% camtarget(camera_target(1:3));
drawnow;

figure(2);
subplot(2,3,1); surf(X1,Y1,Z1,C1,'EdgeColor','none'); xlabel('X'); ylabel('Y'); zlabel('Z'); grid on; axis equal; view(3); camlight; drawnow; 
subplot(2,3,2); surf(X2,Y2,Z2,C2,'EdgeColor','none'); xlabel('X'); ylabel('Y'); zlabel('Z'); grid on; axis equal; view(3); camlight; drawnow; 
subplot(2,3,3); surf(X3,Y3,Z3,C3,'EdgeColor','none'); xlabel('X'); ylabel('Y'); zlabel('Z'); grid on; axis equal; view(3); camlight; drawnow; 
subplot(2,3,4); surf(X4,Y4,Z4,C4,'EdgeColor','none'); xlabel('X'); ylabel('Y'); zlabel('Z'); grid on; axis equal; view(3); camlight; drawnow; 
subplot(2,3,5); surf(X5,Y5,Z5,C5,'EdgeColor','none'); xlabel('X'); ylabel('Y'); zlabel('Z'); grid on; axis equal; view(3); camlight; drawnow; 
subplot(2,3,6); surf(X6,Y6,Z6,C6,'EdgeColor','none'); xlabel('X'); ylabel('Y'); zlabel('Z'); grid on; axis equal; view(3); camlight; drawnow; 
