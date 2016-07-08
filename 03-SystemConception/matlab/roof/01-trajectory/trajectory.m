dt = 0.01; tlen=length(0:dt:Tsum); x=zeros(tlen,1);y=zeros(tlen,1);z=zeros(tlen,1);zAlpha=zeros(tlen,1);zBeta=zeros(tlen,1);
i=0;
for t=0:dt:Tsum
    i=i+1;
    n=find(Tend>=t);
    if(n(1)==1 || n(1)==3 || n(1)==21)
        x(i)=p(from_to(1,n(1)),1)+s(n(1))/(2*pi)*cos(2*pi*(t-Tstart(n(1)))/T(n(1)));
        y(i)=p(from_to(1,n(1)),2)+s(n(1))/(2*pi)*sin(2*pi*(t-Tstart(n(1)))/T(n(1)));
        z(i)=p(from_to(1,n(1)),3);
    else
        xyz=p(from_to(1,n(1)),:)'+((p(from_to(2,n(1)),:)'-p(from_to(1,n(1)),:)')/T(n(1)))*(t-Tstart(n(1)));
        x(i)=xyz(1); y(i)=xyz(2); z(i)=xyz(3);
    end

    if(n(1)==1)
        alpbet_init = getAlphaBeta(z5Dir(from_to(1,1),:)); 
        zAlpha(i)=alpbet_init(1)+(2*pi/T(1))*(t-Tstart(n(1))); zBeta(i)=alpbet_init(2);
    elseif(n(1)==2)
        alpbet_init = getAlphaBeta(z5Dir(from_to(1,2),:)); 
        dalpbet=(getAlphaBeta(z5Dir(from_to(2,2),:))-getAlphaBeta(z5Dir(from_to(1,2),:)))/T(2);
        alpbet = alpbet_init + dalpbet*(t-Tstart(n(1))); 
        zAlpha(i)=alpbet(1); zBeta(i)=alpbet(2);
    else
        alpbet_init = getAlphaBeta(z5Dir(from_to(1,n(1)),:)); 
        zAlpha(i)=alpbet_init(1); dzBeta=alpbet_init(2);
    end
end

t=0:dt:Tsum;