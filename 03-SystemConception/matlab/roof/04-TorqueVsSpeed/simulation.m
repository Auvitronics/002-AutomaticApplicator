clear all
params 



% Simulate
TT=[];XX=[];
for i=1:length(T)
    qInit = invGeomPosition(p(from_to(1,i),:)'+[0;0;-basePos]);
%     [qInit(4),qInit(5)] = invGeomOrientation(z5Dir(from_to(1,i),:)',qInit(1),qInit(2),qInit(3))
    if (i==1); qInit = invGeomPosition(p(from_to(1,i),:)'+[0;0;-basePos]);[qInit(4),qInit(5)] = invGeomOrientation(getAlphaBeta(z5Dir(from_to(1,i),:)'),qInit(1),qInit(2),qInit(3));qInit(5)=qInit(5)+pi;
    else qInit=XX(end,:); end
%     qInit(4)
%     qInit(5)
    [TT_, XX_] = ode45('simSystem', [Tstart(i) Tend(i)], qInit');
    TT = [TT; TT_(1:end-1)]; XX = [XX; XX_(1:end-1,:)]; 
end


TTT=0.05:0.05:Tsum;
% sinXX=sin(XX);cosXX=cos(XX);
for i=1:size(XX,2)
%     sinXXX(:,i)=interp1(TT,sinXX(:,i),TTT);
%     cosXXX(:,i)=interp1(TT,cosXX(:,i),TTT);
    XXX(:,i)=interp1(TT,XX(:,i),TTT);
end
% XXX=atan2(sinXXX,cosXXX);
TTT = TTT(1:end-1); XXX=XXX(1:end-1,:); % to avoid the last element being NaN

for i=1:5
    dXXX(:,i) = diff(XXX(:,i));
    ddXXX(:,i) = diff(dXXX(:,i));
end
tau = zeros(length(TTT)-2,5);

robotParams
for i=1:(length(TTT)-2)
    q1 = XXX(i,1); dq1 = dXXX(i,1); ddq1 = ddXXX(i,1);
    q2 = XXX(i,2); dq2 = dXXX(i,2); ddq2 = ddXXX(i,2);
    q3 = XXX(i,3); dq3 = dXXX(i,3); ddq3 = ddXXX(i,3);
    q4 = XXX(i,4); dq4 = dXXX(i,4); ddq4 = ddXXX(i,4);
    q5 = XXX(i,5); dq5 = dXXX(i,5); ddq5 = ddXXX(i,5);
    dq = [dq1 dq2 dq3 dq4 dq5]';
    ddq = [ddq1 ddq2 ddq3 ddq4 ddq5]';
    computeDynamics
    tau(i,:) = (A*ddq+C*dq+Q)';
end
rms_tau = rms(tau); rms_dq = rms(dXXX);
max_tau = max(abs(tau)); max_dq = max(abs(dXXX));
folderExists = true; vNum = 0;
while folderExists
    vNum = vNum + 1;
    vDir = sprintf('results/%03d', vNum);
    folderExists = (exist(vDir,'dir')==7);
end
mkdir(vDir); 
filesToCopy = { 'params.m', 'robotParams.m'};
for i=1:length(filesToCopy); copyfile(filesToCopy{i}, [vDir '/' filesToCopy{i}]); end
fid = fopen([vDir '/ratings'], 'w');
s1 = sprintf('rms torques    (Nm): %d, %d, %d, %d, %d\n', rms_tau(1), rms_tau(2), rms_tau(3), rms_tau(4), rms_tau(5));
s2 = sprintf('rms speeds  (rad/s): %d, %d, %d, %d, %d\n', rms_dq(1), rms_dq(2), rms_dq(3), rms_dq(4), rms_dq(5));
s3 = sprintf('peak torques   (Nm): %d, %d, %d, %d, %d\n', max_tau(1), max_tau(2), max_tau(3), max_tau(4), max_tau(5));
s4 = sprintf('peak speeds (rad/s): %d, %d, %d, %d, %d\n', max_dq(1), max_dq(2), max_dq(3), max_dq(4), max_dq(5));
fprintf(fid, '%s%s%s%s', s1, s2, s3, s4);
display([s1 s2 s3 s4]);
fclose(fid);

TTT = TTT(1:(end-2)); XXX = XXX(1:(end-2),:); dXXX = dXXX(1:(end-1),:);
close all
figure('units','normalized','outerposition',[0 0 1 1])
for i=1:5
    subplot(4,5,i);
    plot(TTT,XXX(:,i));
    legend(['q' num2str(i)]);
    subplot(4,5,i+5);
    plot(TTT,dXXX(:,i),TTT,ddXXX(:,i));
    legend(['dq' num2str(i)],['ddq' num2str(i)]);
    subplot(4,5,i+10);
    plot(TTT,tau(:,i));
    legend(['tau' num2str(i)]);
    subplot(4,5,i+15);
    plot(dXXX(:,i),tau(:,i),'*'); hold on;
    plot(rms_dq(i),rms_tau(i),'r*', 'LineWidth',2,'MarkerSize', 10);
    title(['tau' num2str(i) ' vs dq' num2str(i)]);
end

saveas(gcf, [vDir '/plots.fig']);