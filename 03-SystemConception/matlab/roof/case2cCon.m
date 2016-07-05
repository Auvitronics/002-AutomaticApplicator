function [c,ceq]=case2cCon(x)

%global a b
a=0.3048*(5^2+4^2)^0.5; % length in meters of diagonal along the XY plane on the specified workspace
b=0.3048*3; % length in meters along the Z direction of the specified workspace

c = [a-2*((x(2)*(2*x(1)+x(2)))^.5); ...
    b-((x(1)+x(2))^2-(a/2)^2)^.5+(x(2)^2-x(1)^2)^.5;...
    -x(2)+(2*x(1)^2-x(2))^.5+a/2];
ceq = [];