% clear all
% params 
% 
% 
% 
% % Simulate
% TT=[];XX=[];
% for i=1:length(T)
%     qInit = invGeomPosition(p(from_to(1,i),:)'+[0;0;-basePos]);
% %     [qInit(4),qInit(5)] = invGeomOrientation(z5Dir(from_to(1,i),:)',qInit(1),qInit(2),qInit(3))
%     if (i==1); qInit = invGeomPosition(p(from_to(1,i),:)'+[0;0;-basePos]);[qInit(4),qInit(5)] = invGeomOrientation(getAlphaBeta(z5Dir(from_to(1,i),:)'),qInit(1),qInit(2),qInit(3));%qInit(4)=-qInit(4);qInit(5)=-qInit(5);
%     else qInit=XX(end,:); end
% %     qInit(4)
% %     qInit(5)
%     [TT_, XX_] = ode45('simSystem', [Tstart(i) Tend(i)], qInit');
%     TT = [TT; TT_(1:end-1)]; XX = [XX; XX_(1:end-1,:)]; 
% end
% 
% 
% % render
% TTT=0.05:0.05:Tsum;
% sinXX=sin(XX);cosXX=cos(XX);
% for i=1:size(XX,2)
%     sinXXX(:,i)=interp1(TT,sinXX(:,i),TTT);
%     cosXXX(:,i)=interp1(TT,cosXX(:,i),TTT);
% end
% XXX=atan2(sinXXX,cosXXX);
clear all
load simresult.mat

close all
figure(1);
clf;
w=getWheel();
w.Z=w.Z-basePos; Cw(:,:,1)=192/255*ones(size(w.X)); Cw(:,:,2)=192/255*ones(size(w.X)); Cw(:,:,3)=192/255*ones(size(w.X)); tw = hgtransform; surf(w.X,w.Y,w.Z, Cw, 'EdgeColor', 'none', 'Parent', tw); hold on;

q1=XXX(1,1); q2=XXX(1,2); q3=XXX(1,3); q4=XXX(1,4); q5=XXX(1,5);
    
A0=-eye(3); P0=[0 0 0]'; T0=[A0, P0; [0 0 0 1]];
A1=[[cos(q1+pi/2) sin(q1+pi/2) 0]',[-sin(q1+pi/2) cos(q1+pi/2) 0]',[0 0 1]']; P1=[0 0 L1/2]';    T1=T0*[A1, P1; [0 0 0 1]];
A2=[[1 0 0]',[0 cos(q2) sin(q2)]',[0 -sin(q2) cos(q2)]']; P2=[0 0 L1/2]';                        T2=T1*[A2, P2; [0 0 0 1]];
A3=[[1 0 0]',[0 cos(q3) sin(q3)]',[0 -sin(q3) cos(q3)]']; P3=[0 0 L2]';                          T3=T2*[A3, P3; [0 0 0 1]];
A4=[[cos(q4-pi/2) sin(q4-pi/2) 0]',[-sin(q4-pi/2) cos(q4-pi/2) 0]',[0 0 1]']; P4=[0 0 0.7*L3]';    T4=T3*[A4, P4; [0 0 0 1]];
A5=[[1 0 0]',[0 cos(q5) sin(q5)]',[0 -sin(q5) cos(q5)]']; P5=[0 0 0.3*L3]';                        T5=T4*[A5, P5; [0 0 0 1]];

[X1,Y1,Z1,C1]=asy1(2*R1,0.67*R1,R1,L1/2);                                   t0 = hgtransform; surf(X1,Y1,Z1,C1,'EdgeColor','none', 'Parent', t0); set(t0, 'Matrix', T0); hold on;
[X2,Y2,Z2,C2]=asy2(R1,linkWidth*R2,capWidth*R2,R2,L1/2);                    t1 = hgtransform; surf(X2,Y2,Z2,C2,'EdgeColor','none', 'Parent', t1); set(t1, 'Matrix', T1); hold on;
[X3,Y3,Z3,C3]=asy3(R2,capWidth*R2,linkWidth*(R2+R3)/2,capWidth*R3,R3,L2);   t2 = hgtransform; surf(X3,Y3,Z3,C3,'EdgeColor','none', 'Parent', t2); set(t2, 'Matrix', T2); hold on;
[X4,Y4,Z4,C4]=asy4(R3,capWidth*R4,linkWidth*R4,R4,0.7*L3);                  t3 = hgtransform; surf(X4,Y4,Z4,C4,'EdgeColor','none', 'Parent', t3); set(t3, 'Matrix', T3); hold on;
[X5,Y5,Z5,C5]=asy2(R4,linkWidth*R5,capWidth*R5,R5,0.3*L3);                  t4 = hgtransform; surf(X5,Y5,Z5,C5,'EdgeColor','none', 'Parent', t4); set(t4, 'Matrix', T4); hold on;
[X6,Y6,Z6,C6]=asy5(R5,capWidth*R5,linkWidth*R5);                            t5 = hgtransform; surf(X6,Y6,Z6,C6,'EdgeColor','none', 'Parent', t5); set(t5, 'Matrix', T5); hold on;
xlabel('X'); ylabel('Y'); zlabel('Z'); 
grid on; 
axis equal
xlims=xlim; ylims=ylim; zlims=zlim;
maxlim=max(abs([xlims ylims]));
xlims=[-maxlim maxlim];
ylims=[-maxlim maxlim];
% axis manual
[az0,el0]=view;
k=0; in_or_out=1;
plotstep=1;
% writerObj = VideoWriter('simulation.avi');
% axis_speed_gain=0.1; axis_center=0; plot_memory=1; plot_step=1;
% writerObj.FrameRate = 1/((TTT(3)-TTT(2))*plot_step);
% open(writerObj);

for i=2:plotstep:length(TTT)
    
%     surf(w.X,w.Y,w.Z, Cw, 'EdgeColor', 'none'); hold on;
    
    q1=XXX(i,1); q2=XXX(i,2); q3=XXX(i,3); q4=XXX(i,4); q5=XXX(i,5);
    
    A0=-eye(3); P0=[0 0 0]'; T0=[A0, P0; [0 0 0 1]];
    A1=[[cos(q1+pi/2) sin(q1+pi/2) 0]',[-sin(q1+pi/2) cos(q1+pi/2) 0]',[0 0 1]']; P1=[0 0 L1/2]';    T1=T0*[A1, P1; [0 0 0 1]];
    A2=[[1 0 0]',[0 cos(q2) sin(q2)]',[0 -sin(q2) cos(q2)]']; P2=[0 0 L1/2]';                        T2=T1*[A2, P2; [0 0 0 1]];
    A3=[[1 0 0]',[0 cos(q3) sin(q3)]',[0 -sin(q3) cos(q3)]']; P3=[0 0 L2]';                          T3=T2*[A3, P3; [0 0 0 1]];
    A4=[[cos(q4-pi/2) sin(q4-pi/2) 0]',[-sin(q4-pi/2) cos(q4-pi/2) 0]',[0 0 1]']; P4=[0 0 0.7*L3]';    T4=T3*[A4, P4; [0 0 0 1]];
    A5=[[1 0 0]',[0 cos(q5) sin(q5)]',[0 -sin(q5) cos(q5)]']; P5=[0 0 0.3*L3]';                        T5=T4*[A5, P5; [0 0 0 1]];

     set(tw, 'Matrix', eye(4));
     set(t0, 'Matrix', T0);
     set(t1, 'Matrix', T1);
     set(t2, 'Matrix', T2);
     set(t3, 'Matrix', T3);
     set(t4, 'Matrix', T4);
     set(t5, 'Matrix', T5);

    % el0 to 89, az0 to az0+180, 91 to 269, az0+180 to az0, 271 to el0+360
    Taz1=7; Taz2=5; Tel=Tsum/2-10; Tel1=Tel*(60-el0)/356; Tel2=Tel*149/356; Tel3=Tel*(el0+89)/356; 
    if TTT(i)<=Tsum/2; 
        az=az0+360*TTT(i)/(Tsum/2); 
        el=el0;
    elseif TTT(i)>Tsum/2 && TTT(i)<=Tsum/2+Tel1
        el=el0+(60-el0)*(TTT(i)-Tsum/2)/(Tel1); az=az0;
    elseif TTT(i)>Tsum/2+Tel1 && TTT(i)<=Tsum/2+Tel1+Taz1
        az=az0+180*(TTT(i)-Tsum/2-Tel1)/Taz1; el=60;
    elseif TTT(i)>Tsum/2+Tel1+Taz1 && TTT(i)<=Tsum/2+Tel1+Taz1+Tel2
        el=60-149*(TTT(i)-Tsum/2-Tel1-Taz1)/(Tel2); az=az0+180;
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
    camlight
    camera_target=T5*[0;0;(4/3)*(R1+R2);1];
    camtarget(camera_target(1:3));
    drawnow;
%     frame=getframe;
%     image=frame2im(frame);
%     image=imresize(image,[628 1240]);
%     frame=im2frame(image);
%     writeVideo(writerObj, frame);
end
close(writerObj);