% This code is to visualize the workspace of a robot shown in topology.png

syms q1 q2 q3 q4 q5 L1 L2 L3 real

f0.x = [1; 0; 0]; f0.y = [0; 1; 0]; f0.z = [0; 0; 1]; f0.P = [0; 0; 0];
f1.x = [cos(q1); 0; -sin(q1)]; f1.y = [0; 1; 0];              f1.z = [sin(q1); 0; cos(q1)];  f1.P = [0; L1; 0]; f1.A = [f1.x f1.y f1.z]; f1.Tf=[f1.A f1.P; 0 0 0 1];
f2.x = [cos(q2); sin(q2); 0];  f2.y = [-sin(q2); cos(q2); 0]; f2.z = [0; 0; 1];              f2.P = [0; 0; 0];  f2.A = [f2.x f2.y f2.z]; f2.Tf=[f2.A f2.P; 0 0 0 1];
f3.x = [cos(q3); sin(q3); 0];  f3.y = [-sin(q3); cos(q3); 0]; f3.z = [0; 0; 1];              f3.P = [0; L2; 0]; f3.A = [f3.x f3.y f3.z]; f3.Tf=[f3.A f3.P; 0 0 0 1];
f4.x = [cos(q4); 0; -sin(q4)]; f4.y = [0; 1; 0];              f4.z = [sin(q4); 0; cos(q4)];  f4.P = [0; L3; 0]; f4.A = [f4.x f4.y f4.z]; f4.Tf=[f4.A f4.P; 0 0 0 1];
f5.x = [1; 0; 0];              f5.y = [0; cos(q5); sin(q5)];  f5.z = [0; -sin(q4); cos(q5)]; f5.P = [0; 0; 0];  f5.A = [f5.x f5.y f5.z]; f5.Tf=[f5.A f5.P; 0 0 0 1];
