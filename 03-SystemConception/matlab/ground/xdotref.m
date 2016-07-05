function [v,w] = xdotref(t)

global p s from_to T Tstart Tend alpha

n=find(Tend>=t);
if(isempty(n))
    v=[0; 0; 0];
elseif(n(1)==1 || n(1)==3 || n(1)==21)
    v=[-s(n(1))/T(n(1))*sin(2*pi*(t-Tstart(n(1)))/T(n(1))); ...
        s(n(1))/T(n(1))*cos(2*pi*(t-Tstart(n(1)))/T(n(1)));...
        0];
else
    v=(p(from_to(2,n(1)),:)'-p(from_to(1,n(1)),:)')/T(n(1));
end

if(isempty(n))
    w=[0; 0; 0];
elseif(n(1)==1)
    w=[0; 0; 2*pi/T(1)];
elseif(n(1)==2)
    w=[0;-(pi/2-alpha)/T(2); 0];
else
    w=[0;0;0];
end

