function [X,Y,Z,C]=asy3(R1,R2,R3,R4,R5,L)

dl=L/1000;
gray=[192,192,192]/255;
gold=[255,215,0]/255;

% section 1
z01=[0;0];
x01=[0.75*R1;1.25*R1];
r1=[0.9*R1;0.9*R1];
c1=[gold;gold];

% section 2
x02=x01(end)+(dl/10:dl/10:0.1*R1)';
z02=zeros(length(x02),1);
r2=R2+(0.9*R1-R2)*sigmf(x02'-x02(1),[-16/(0.1*R1) 0.5*(0.1*R1)]);r2(1)=r1(end);r2=r2';
c2=ones(length(x02),1)*gray;

% section 3
z03=(dl/10:dl/10:0.1*R1-dl/10)';
x03=x02(end)+((0.1*R1)^2-(z03-0.1*R1).^2).^.5;
r3=R2*ones(length(z03),1);
c3=ones(length(z03),1)*gray;

% section 4
z04=[0.1*R1;2*(R1+R2)/3];
x04=[1.45*R1;1.45*R1];
r4=[R2;R2];
c4=[gray;gray];

% section 5
z05=z04(end)+(dl:dl:2*(R1+R2)/3)';
x05=1.45*R1*sigmf(z05-z04(end),[-16/(2*(R1+R2)/3) 0.5*(2*(R1+R2)/3)]);
r5=[R2*ones(length(z05)-floor(length(z05)/2),1);R2+(R3-R2)*(1:(floor(length(z05)/2)))'/(floor(length(z05)/2))]; 
c5=ones(length(z05),1)*gray;

% section 6
z06=z05(end)+[dl;L-4*(R1+R2)/3-4*(R3+R4)/3];
x06=[0;0];
r6=[R3;R3];
c6=[gray;gray];

% section 7
z07=z06(end)+(dl:dl:2*(R4+R5)/3)';
x07=-1.45*R5+1.45*R5*sigmf(z07'-z06(end),[-16/(2*(R4+R5)/3) 0.5*(2*(R4+R5)/3)]); x07=x07';
r7=[R4+(R3-R4)*((floor(length(z07)/2)):-1:1)'/(floor(length(z07)/2));R4*ones(length(z07)-floor(length(z07)/2),1)]; 
c7 = ones(length(z07),1)*gray;

% section 8
z08=z07(end)+[dl;2*(R4+R5)/3];
x08=[-1.45*R5; -1.45*R5];
r8=[R4; R4]; 
c8 = [gray; gray];

% section 9
z09=z08(end)+(dl/10:dl/10:0.1*R5-dl/10)';
x09=-1.35*R5-((.1*R5)^2-(z09-z08(end)).^2).^.5;
r9=R4*ones(length(x09),1);
c9=ones(length(z09),1)*gray;

% section 10
x010=(-1.35*R5:dl/10:-1.25*R5-dl/10)';
z010=L*ones(length(x010),1);
r10=R4+(0.8*R5-R4)*sigmf(x010'-x010(1),[16/(0.1*R5) 0.5*(0.1*R5)]); r10=r10';
c10=ones(length(x010),1)*gray;

% section 11
z011=[L;L;L;L];
x011=[-1.25*R5;-1.25*R5+dl;0.75*R5-dl;0.75*R5];
r11=[0.8*R5;R5;R5;0.9*R5];
c11=[gold;gold;gold;gold];

% cyliner
z0=[z01;z02;z03;z04;z05;z06;z07;z08;z09;z010;z011];
x0=[x01;x02;x03;x04;x05;x06;x07;x08;x09;x010;x011];
r=[r1;r2;r3;r4;r5;r6;r7;r8;r9;r10;r11];
c=[c1;c2;c3;c4;c5;c6;c7;c8;c9;c10;c11];
[X,Y,Z,C] = myCylinder(r,c,x0,z0,200);
