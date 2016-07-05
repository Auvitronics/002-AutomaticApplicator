function [c,ceq] = case1Con(x)
global a b

c = [a-2*(2*x(1)*(x(1)+x(2)))^.5; ...
    b-((x(1)+x(2))^2-(a/2)^2)^.5+(x(2)^2-x(1)^2)^.5];
ceq = [];
