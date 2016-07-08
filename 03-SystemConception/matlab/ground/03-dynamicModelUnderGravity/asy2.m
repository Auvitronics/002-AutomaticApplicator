function [X,Y,Z,C]=asy2(R1,R2,R3,R4,L)

dl=L/1000;
gray=[192,192,192]/255;
gold=[255,215,0]/255;

% section 1
z01=[0 0.5*R1]';
x01=[0 0]';
r1=[0.9*R1 0.9*R1]';
c1=[gold; gold];

% section 2
z02=z01(end)+(dl:dl:0.4*R1)';
x02=zeros(length(z02),1);
r2=R2+(R1-R2)*sigmf(z02'-z01(end),[-16/(0.4*R1) 0.5*(0.4*R1)]); r2(1)=0.9*R1; r2=r2';
c2 = ones(length(z02),1)*gray;

% section 3
z03=z02(end)+[dl; L-0.5*R1-0.4*R1-(R3+R4)/3-(R3+R4)-0.1*R4];
x03=[0; 0];
r3=[R2; R2];
c3=[gray; gray];

% section 4
z04=z03(end)+(dl:dl:2*(R3+R4)/3)';
x04=-1.45*R4+1.45*R4*sigmf(z04'-z03(end),[-16/(2*(R3+R4)/3) 0.5*(2*(R3+R4)/3)]); x04=x04';
% plot(z04,x04);
r4=[R3+(R2-R3)*((floor(length(z04)/2)):-1:1)'/(floor(length(z04)/2));R3*ones(length(z04)-floor(length(z04)/2),1)]; 
c4 = ones(length(z04),1)*gray;

% section 5
z05=z04(end)+[dl;2*(R3+R4)/3];
x05=[-1.45*R4; -1.45*R4];
r5=[R3; R3]; 
c5 = [gray; gray];

% section 6
z06=z05(end)+(dl/10:dl/10:0.1*R4-dl/10)';
x06=-1.35*R4-((.1*R4)^2-(z06-z05(end)).^2).^.5;
r6=R3*ones(length(x06),1);;%+(0.8*R4-R3)*(0:(length(z06)-1))'/(length(z06)-1);
c6=ones(length(z06),1)*gray;
% real([z06 z06-z05(end) (z06-z05(end)).^2 (.1*R4)^2-(z06-z05(end)).^2 ((.1*R4)^2-(z06-z05(end)).^2).^.5])
% imag([z06 z06-z05(end) (z06-z05(end)).^2 (.1*R4)^2-(z06-z05(end)).^2 ((.1*R4)^2-(z06-z05(end)).^2).^.5])

% section 7
x07=(-1.35*R4:dl/10:-1.25*R4-dl/10)';
z07=L*ones(length(x07),1);
r7=R3+(0.8*R4-R3)*sigmf(x07'-x07(1),[16/(0.1*R4) 0.5*(0.1*R4)]); r7=r7';
c7=ones(length(x07),1)*gray;

% section 8
z08=[L;L;L;L];
x08=[-1.25*R4;-1.25*R4+dl;0.75*R4-dl;0.75*R4];
r8=[0.8*R4;R4;R4;0.9*R4];
c8=[gold;gold;gold;gold];


% cylinder
z0=[z01;z02;z03;z04;z05;z06;z07;z08];
x0=[x01;x02;x03;x04;x05;x06;x07;x08];
r=[r1;r2;r3;r4;r5;r6;r7;r8];
c=[c1;c2;c3;c4;c5;c6;c7;c8];
% z0=[z01;z02;z03;z04;z05;z06];
% x0=[x01;x02;x03;x04;x05;x06];
% r=[r1;r2;r3;r4;r5;r6];
% c=[c1;c2;c3;c4;c5;c6];
% display('r');
% size(r1)
% size(r2)
% size(r3)
% size(r4)
% size(r5)
% size(r6)
% size(r7)
% size(r8)
% display('c');
% size(c1)
% size(c2)
% size(c3)
% size(c4)
% size(c5)
% size(c6)
% size(c7)
% size(c8)
% display('x0');
% size(x01)
% size(x02)
% size(x03)
% size(x04)
% size(x05)
% size(x06)
% size(x07)
% size(x08)
% display('z0');
% size(z01)
% size(z02)
% size(z03)
% size(z04)
% size(z05)
% size(z06)
% size(z07)
% size(z08)
% 
% display('r c x0 z0');
% [size(r);size(c);size(x0);size(z0)]
[X,Y,Z,C] = myCylinder(r,c,x0,z0,200);
