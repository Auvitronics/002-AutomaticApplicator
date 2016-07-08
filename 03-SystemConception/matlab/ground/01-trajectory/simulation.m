clear all
params 



% Simulate
TT=[];XX=[];
for i=1:length(T)
    qInit = invGeomPosition(p(from_to(1,i),:)'+[d+yW/2;0;0]);
    if i==1; [qInit(4),qInit(5)] = invGeomOrientation(z5Dir(from_to(1,i),:)',qInit(1),qInit(2),qInit(3));%qInit(4)=-qInit(4);qInit(5)=-qInit(5);
    else qInit(4)=XX(end,4); qInit(5)=XX(end,5); end
    [TT_, XX_] = ode45('simSystem', [Tstart(i) Tend(i)], qInit');
    TT = [TT; TT_(1:end-1)]; XX = [XX; XX_(1:end-1,:)]; 
end

render = 1;

if render==1
% render
TTT=0.05:0.05:Tsum;
for i=1:size(XX,2)
    XXX(:,i)=interp1(TT,XX(:,i),TTT);
end


close all
figure(1);
clf;
w=getWheel();
w.X=w.X+d+yW/2; Cw(:,:,1)=192/255*ones(size(w.X)); Cw(:,:,2)=192/255*ones(size(w.X)); Cw(:,:,3)=192/255*ones(size(w.X));
[X1,Y1,Z1,C1]=asy1(2*R1,0.67*R1,R1,L1/2);
[X2,Y2,Z2,C2]=asy2(R1,linkWidth*R2,capWidth*R2,R2,L1/2);
[X3,Y3,Z3,C3]=asy3(R2,capWidth*R2,linkWidth*(R2+R3)/2,capWidth*R3,R3,L2); 
[X4,Y4,Z4,C4]=asy4(R3,capWidth*R4,linkWidth*R4,R4,0.7*L3); 
[X5,Y5,Z5,C5]=asy2(R4,linkWidth*R5,capWidth*R5,R5,0.3*L3); 
[X6,Y6,Z6,C6]=asy5(R5,capWidth*R5,linkWidth*R5);
k=0; in_or_out=1;
plotstep=20;
writerObj = VideoWriter('simulation.avi');
axis_speed_gain=0.1; axis_center=0; plot_memory=1; plot_step=1;
writerObj.FrameRate = 1/((TTT(3)-TTT(2))*plot_step);
open(writerObj);

for i=1:plotstep:length(TTT)
    clf;
    surf(w.X,w.Y,w.Z, Cw, 'EdgeColor', 'none'); hold on;
    q1=XXX(i,1); q2=XXX(i,2); q3=XXX(i,3); q4=XXX(i,4); q5=XXX(i,5);
%       q1=0; q2=0; q3=0; q4=0; q5=0;
    
%     A0=eye(3); P0=[0 0 -L1]'; T0=[A0, P0; [0 0 0 1]];
%     A1=[[cos(q1-pi/2) sin(q1-pi/2) 0]',[-sin(q1-pi/2) cos(q1-pi/2) 0]',[0 0 1]']; P1=[0 0 L1/2]';    T1=T0*[A1, P1; [0 0 0 1]];
%     A2=[[1 0 0]',[0 -sin(q2+pi/2) cos(q2+pi/2)]',[0 cos(q2+pi/2) sin(q2+pi/2)]']; P2=[0 0 L1/2]';                        T2=T1*[A2, P2; [0 0 0 1]];
%     A3=[[1 0 0]',[0 -sin(-q3+pi/2) cos(-q3+pi/2)]',[0 cos(-q3+pi/2) sin(-q3+pi/2)]']; P3=[0 0 L2]';                          T3=T2*[A3, P3; [0 0 0 1]];
%     A4=[[cos(q4-pi) sin(q4-pi) 0]',[-sin(q4-pi) cos(q4-pi) 0]',[0 0 1]']; P4=[0 0 0.7*L3]';    T4=T3*[A4, P4; [0 0 0 1]];
%     A5=[[cos(q5) 0 sin(q5)]',[0 1 0]',[-sin(q5) 0 cos(q5)]']; P5=[0 0 0.3*L3]';                        T5=T4*[A5, P5; [0 0 0 1]];
%     A0=eye(3); P0=[0 0 -L1]'; T0=[A0, P0; [0 0 0 1]];
%     A1=[[cos(q1+pi/2) sin(q1+pi/2) 0]',[-sin(q1+pi/2) cos(q1+pi/2) 0]',[0 0 1]']; P1=[0 0 L1/2]';    T1=T0*[A1, P1; [0 0 0 1]];
%     A2=[[1 0 0]',[0 cos(q2) sin(q2)]',[0 -sin(q2) cos(q2)]']; P2=[0 0 L1/2]';                        T2=T1*[A2, P2; [0 0 0 1]];
%     A3=[[1 0 0]',[0 cos(q3) sin(q3)]',[0 -sin(q3) cos(q3)]']; P3=[0 0 L2]';                          T3=T2*[A3, P3; [0 0 0 1]];
%     A4=[[cos(q4-pi/2) sin(q4-pi/2) 0]',[-sin(q4-pi/2) cos(q4-pi/2) 0]',[0 0 1]']; P4=[0 0 0.7*L3]';    T4=T3*[A4, P4; [0 0 0 1]];
%     A5=[[1 0 0]',[0 cos(q5) sin(q5)]',[0 -sin(q5) cos(q5)]']; P5=[0 0 0.3*L3]';                        T5=T4*[A5, P5; [0 0 0 1]];
    A0=eye(3); P0=[0 0 -L1]'; T0=[A0, P0; [0 0 0 1]];
    A1=[[-sin(q1) cos(q1) 0]',[-cos(q1) -sin(q1) 0]',[0 0 1]']; P1=[0 0 L1/2]';    T1=T0*[A1, P1; [0 0 0 1]];
    A2=[[1 0 0]',[0 cos(q2) sin(q2)]',[0 -sin(q2) cos(q2)]']; P2=[0 0 L1/2]';                        T2=T1*[A2, P2; [0 0 0 1]];
    A3=[[1 0 0]',[0 cos(q3) sin(q3)]',[0 -sin(q3) cos(q3)]']; P3=[0 0 L2]';                          T3=T2*[A3, P3; [0 0 0 1]];
    A4=[[sin(q4) -cos(q4) 0]',[cos(q4) sin(q4) 0]',[0 0 1]']; P4=[0 0 0.7*L3]';    T4=T3*[A4, P4; [0 0 0 1]];
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
        axis manual
        [az0,el0]=view;
    end
% 
%     k=k+in_or_out;
%     if mod(k,15)==0
%         in_or_out=-1*in_or_out;
%     end
%     zoom(1.1^k);

    % el0 to 89, az0 to az0+180, 91 to 269, az0+180 to az0, 271 to el0+360
    Taz1=5; Taz2=5; Tel=Tsum/2-10; Tel1=Tel*(89-el0)/356; Tel2=Tel*178/356; Tel3=Tel*(el0+89)/356; 
    if TTT(i)<=Tsum/2; 
        az=az0+360*TTT(i)/(Tsum/2); 
        el=el0;
    elseif TTT(i)>Tsum/2 && TTT(i)<=Tsum/2+Tel1
        el=el0+(89-el0)*(TTT(i)-Tsum/2)/(Tel1); az=az0;
    elseif TTT(i)>Tsum/2+Tel1 && TTT(i)<=Tsum/2+Tel1+Taz1
        az=az0+180*(TTT(i)-Tsum/2-Tel1)/Taz1; el=89;
    elseif TTT(i)>Tsum/2+Tel1+Taz1 && TTT(i)<=Tsum/2+Tel1+Taz1+Tel2
        el=89-178*(TTT(i)-Tsum/2-Tel1-Taz1)/(Tel2); az=az0+180;
    elseif TTT(i)>Tsum/2+Tel1+Taz1+Tel2 && TTT(i)<=Tsum/2+Tel1+Taz1+Tel2+Taz2
        az=az0+180+180*(TTT(i)-Tsum/2-Tel1-Taz1-Tel2)/Taz2; el=-89;
    else 
        el=-89+(el0+89)*(TTT(i)-Tsum/2-Tel1-Taz1-Tel2-Taz2)/(Tel3); az=az0; 
    end
    if TTT(i)<Tsum/4; 
        zoomfactor=1+3*TTT(i)/(Tsum/4); 
    elseif TTT(i)<Tsum/2 
        zoomfactor=4-3*(TTT(i)-Tsum/4)/(Tsum/4); 
    elseif TTT(i)<3*Tsum/4
        zoomfactor=1+3*(TTT(i)-Tsum/2)/(Tsum/4); 
    else
        zoomfactor=4-3*(TTT(i)-3*Tsum/4)/(Tsum/4); 
    end
%     view(az,el); zoom(zoomfactor);
    xlim(xlims); ylim(ylims); zlim(zlims);
%     campos(camposition);
    camlight
    camera_target=T5*[0;0;(4/3)*(R1+R2);1];
    camtarget(camera_target(1:3));
    drawnow;
    frame=getframe;
    image=frame2im(frame);
    image=imresize(image,[628 1240]);
    frame=im2frame(image);
    writeVideo(writerObj, frame);
%     0 -L1 0
%     0 0 0
%     -L2*sin(q2)*cos(q1) L2*cos(q2) L2*sin(q2)*sin(q1)
%     -(L2*sin(q2)+L3*sin(q2+q3))*cos(q1) L2*cos(q2)+L3*cos(q2+q3) (L2*sin(q2)+L3*sin(q2+q3))*sin(q1)
end
close(writerObj);
end