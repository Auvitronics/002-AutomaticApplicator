function xdot = simSystem(t,x)

q1 = x(1); q2 = x(2); q3 = x(3); q4 = x(4); q5 = x(5);
dq1 = x(6); dq2 = x(7); dq3 = x(8); dq4 = x(9); dq5 = x(10);
dq = [dq1; dq2; dq3; dq4; dq5];
Fric = .5*dq;

robotParams
computeDynamics

xdot = zeros(10,1);
xdot(1:5) = x(6:10);
xdot(6:10) = A\(-C*dq-Q-Fric);