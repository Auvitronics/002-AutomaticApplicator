R1=2*0.075;
R2=2*0.05;
R3=2*0.04;
R4=2*0.03;
R5=2.5*0.02;
linkWidth=0.5;
capWidth=0.25;

L1 = 1;
d = 1.5*0.3048; % distance between worspace and base link
xW = 5*0.3048; yW = 4*0.3048; zW = 3*0.3048; % workspace specs
l = ((xW/2)^2+(d+yW)^2)^.5-d; % length of longest cross section to cover
L2plusL3=((d+l)^2+(zW/2)^2)/(d+l); % optimum link lengths total
L2plusL3 = 1.25*L2plusL3; %margin to avoid collision
L2=0.5*L2plusL3;
L3=L2plusL3-L2;

g = 9.8;


m0 = 1; mm = 1.5; % Parameters for assumed masses
% Inertia of a cylinder when the origin of reference frame is in center and
% length of cylinder is along the z-axis:
% [1/12*m*(3*r^2+h^2) 0 0; 0 1/12*m*(3*r^2+h^2); 0 0 1/2*m*r^2]
% We assume the reference frame origin is at the botton of our cylinder
% meaning at coordinate (0,0,-h/2). Using parallel-axis theorem, the new
% inertia tensor will be original plus the following:
% [1/4*h^2 0 0;0 1/4*h^2 0;0 0 0]
% New inertia becomes [1/12*m*(3*r^2+4*h^2) 0 0; 0 1/12*m*(3*r^2+4*h^2); 0 0 1/2*m*r^2]

m_1 = m0+mm^4;
MX_1 = m_1*0;
MY_1 = m_1*0;
MZ_1 = m_1*L1/4;
m = m_1; r = 0.75*R1; h = L1/2;
XX_1 = 1/12*m*(3*r^2+4*h^2);
XY_1 = 0;
XZ_1 = 0;
YY_1 = 1/12*m*(3*r^2+4*h^2);
YZ_1 = 0;
ZZ_1 = 1/2*m*r^2;

m_2 = m0+mm^3;
MX_2 = m_2*0;
MY_2 = m_2*0;
MZ_2 = m_2*L2/2;
m = m_2; r = 0.75*R2; h = L2;
XX_2 = 1/12*m*(3*r^2+4*h^2);
XY_2 = 0;
XZ_2 = 0;
YY_2 = 1/12*m*(3*r^2+4*h^2);
YZ_2 = 0;
ZZ_2 = 1/2*m*r^2;

m_3 = m0+mm^2;
MX_3 = m_3*0;
MY_3 = m_3*0;
MZ_3 = m_3*0.7*L3/2;
m = m_3; r = 0.75*R3; h = 0.7*L3;
XX_3 = 1/12*m*(3*r^2+4*h^2);
XY_3 = 0;
XZ_3 = 0;
YY_3 = 1/12*m*(3*r^2+4*h^2);
YZ_3 = 0;
ZZ_3 = 1/2*m*r^2;

m_4 = m0+mm^1;
MX_4 = m_4*0;
MY_4 = m_4*0;
MZ_4 = m_4*0.3*L3/2;
m = m_4; r = 0.75*R4; h = 0.3*L3;
XX_4 = 1/12*m*(3*r^2+4*h^2);
XY_4 = 0;
XZ_4 = 0;
YY_4 = 1/12*m*(3*r^2+4*h^2);
YZ_4 = 0;
ZZ_4 = 1/2*m*r^2;

m_5 = m0+mm^0;
MX_5 = m_5*0;
MY_5 = m_5*0;
MZ_5 = m_5*5e-2;
m = m_5; r = 0.75*R5; h = 5e-2;
XX_5 = 1/12*m*(3*r^2+4*h^2);
XY_5 = 0;
XZ_5 = 0;
YY_5 = 1/12*m*(3*r^2+4*h^2);
YZ_5 = 0;
ZZ_5 = 1/2*m*r^2;

