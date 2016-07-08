function f = getFrames(nFrames)

% This function generates a map. The keys to the maps are string literals
% in {'1', '2', '3', '4', '5'}
% and the values are structs that have members associated with the 
% respective joints of the robot. 
% 'x', 'y', 'z', 'P' define the unit vectors and position of origin of the 
% frame represented in the antecedent frame
% 'e' is the local angular speed of the frame represented in the same frame
% 'a' contains the key to the antecedent frame
% 'param' contains the inertial parameters of the respective link 
% 'q','dq' and 'ddq' contain associated joint pos, vel and acc variables
% 'o' defines the row of inertia matrix A (in the dynamic equations) that 
% corresponds to the current joint.

syms q1 q2 q3 q4 q5 real
syms dq1 dq2 dq3 dq4 dq5 real
syms ddq1 ddq2 ddq3 ddq4 ddq5 real
syms L1 L2 L3 real
syms m_1 MX_1 MY_1 MZ_1 XX_1 XY_1 XZ_1 YY_1 YZ_1 ZZ_1 real
syms m_2 MX_2 MY_2 MZ_2 XX_2 XY_2 XZ_2 YY_2 YZ_2 ZZ_2 real
syms m_3 MX_3 MY_3 MZ_3 XX_3 XY_3 XZ_3 YY_3 YZ_3 ZZ_3 real
syms m_4 MX_4 MY_4 MZ_4 XX_4 XY_4 XZ_4 YY_4 YZ_4 ZZ_4 real
syms m_5 MX_5 MY_5 MZ_5 XX_5 XY_5 XZ_5 YY_5 YZ_5 ZZ_5 real

nullSym = sym([0; 0; 0]); nullSymParam = sym(zeros(10,1));
frame.x = nullSym; frame.y = nullSym; frame.z = nullSym; frame.P = nullSym;
frame.e = nullSym; frame.a = ''; frame.param = nullSymParam;
frame.q = sym(0); frame.dq = sym(0); frame.o = 0;
frame.angVel = sym(0); frame.linVel = sym(0); 
frame.angAcc = sym(0); frame.linAcc = sym(0); 
frame.gotAngVel = false; frame.gotLinVel = false; 
frame.gotAngAcc = false; frame.gotLinAcc = false; 

frame.x = sym([1; 0; 0]); frame.y = sym([0; 1; 0]);
frame.z = sym([0; 0; 1]); frame.P = sym([0; 0; 0]);
frame.e = [0; 0; 0]; frame.a = '0';
frame.q = sym(0); frame.dq = sym(0); frame.o = 0;
frame.param = nullSymParam;
% f('0') = frame;
F{1} = frame;

frame.x = sym([-sin(q1); cos(q1); 0]); frame.y = [-cos(q1); -sin(q1); 0];
frame.z = [0; 0; 1]; frame.P = sym([0; 0; -L1/2]);
frame.e = [0; 0; 1]; frame.a = '0';
frame.q = q1; frame.dq = dq1; frame.ddq = ddq1; frame.o = 1;
frame.param = [m_1 MX_1 MY_1 MZ_1 XX_1 XY_1 XZ_1 YY_1 YZ_1 ZZ_1];
% f('1') = frame;
F{2} = frame;

frame.x = sym([1; 0; 0]); frame.y = [0; cos(q2); sin(q2)];
frame.z = [0; -sin(q2); cos(q2)]; frame.P = [0; 0; L1/2];
frame.e = [1; 0; 0];  frame.a = '1';
frame.q = q2; frame.dq = dq2; frame.ddq = ddq2; frame.o = 2;
frame.param = [m_2 MX_2 MY_2 MZ_2 XX_2 XY_2 XZ_2 YY_2 YZ_2 ZZ_2];
% f('2') = frame;
F{3} = frame;

frame.x = [1; 0; 0]; frame.y = sym([0; cos(q3); sin(q3)]);
frame.z = [0; -sin(q3); cos(q3)]; frame.P = [0; 0; L2];
frame.e = [1; 0; 0];  frame.a = '2';
frame.q = q3; frame.dq = dq3; frame.ddq = ddq3; frame.o = 3;
frame.param = [m_3 MX_3 MY_3 MZ_3 XX_3 XY_3 XZ_3 YY_3 YZ_3 ZZ_3];
% f('3') = frame;
F{4} = frame;

frame.x = [sin(q4); -cos(q4); 0]; frame.y = sym([cos(q4); sin(q4); 0]);
frame.z = [0; 0; 1]; frame.P = sym([0; 0; 0.7*L3]);
frame.e = [0; 0; 1];  frame.a = '3';
frame.q = q4; frame.dq = dq4; frame.ddq = ddq4; frame.o = 4;
frame.param = [m_4 MX_4 MY_4 MZ_4 XX_4 XY_4 XZ_4 YY_4 YZ_4 ZZ_4];
% f('4l') = frame;
F{5} = frame;

frame.x = sym([1; 0; 0]); frame.y = [0; cos(q5); sin(q5)];
frame.z = [0; -sin(q5); cos(q5)]; frame.P = sym([0; 0; 0.3*L3]);
frame.e = [1; 0; 0];  frame.a = '4';
frame.q = q5; frame.dq = dq5; frame.ddq = ddq5; frame.o = 5;
frame.param = [m_5 MX_5 MY_5 MZ_5 XX_5 XY_5 XZ_5 YY_5 YZ_5 ZZ_5];
% f('5l') = frame;
F{6} = frame;

keys = {'0', '1', '2', '3', '4', '5'};

for i=1:nFrames+1; keySet{i} = keys{i}; frames{i} = F{i}; end

f = containers.Map( keySet, frames );
