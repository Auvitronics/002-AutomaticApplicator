function [v,dzAlpha,dzBeta] = xdotrefSM(t)

global p s from_to T Tstart Tend alpha z5Dir
% s(n(1))/(2*pi)*cos(2*pi*SM((t-Tstart(n(1)))/T(n(1))))
% -s(n(1))/T(n(1))*sin(2*pi*SM((t-Tstart(n(1)))/T(n(1))))*dSM((t-Tstart(n(1)))/T(n(1)))
% 
n=find(Tend>=t);
if(isempty(n))
    v=[0; 0; 0];
elseif(n(1)==1 || n(1)==3 || n(1)==21)
    v=[-s(n(1))/T(n(1))*sin(2*pi*SM((t-Tstart(n(1)))/T(n(1))))*dSM((t-Tstart(n(1)))/T(n(1))); ...
        s(n(1))/T(n(1))*cos(2*pi*SM((t-Tstart(n(1)))/T(n(1))))*dSM((t-Tstart(n(1)))/T(n(1)));...
        0];
else
    v=(p(from_to(2,n(1)),:)'-p(from_to(1,n(1)),:)')/T(n(1))*dSM((t-Tstart(n(1)))/T(n(1)));
end

if(isempty(n))
    dzAlpha=0; dzBeta=0;
elseif(n(1)==1)
    dzAlpha=2*pi/T(1)*dSM((t-Tstart(n(1)))/T(n(1))); dzBeta=0;
elseif(n(1)==2)
    dalpbet=(getAlphaBeta(z5Dir(from_to(2,2),:))-getAlphaBeta(z5Dir(from_to(1,2),:)))/T(2)*dSM((t-Tstart(n(1)))/T(n(1)));
    dzAlpha=dalpbet(1); dzBeta=dalpbet(2);
else
   dzAlpha=0; dzBeta=0;
end

