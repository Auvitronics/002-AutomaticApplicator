function [c,ceq]=case2aCon(x)

global a b

c = [a-2*((x(2)*(2*x(1)+x(2)))^.5); ...
    b-((x(1)+x(2))^2-(a/2)^2)^.5+x(1)];
ceq = [];