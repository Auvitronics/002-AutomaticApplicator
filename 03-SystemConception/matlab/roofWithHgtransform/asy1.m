function [X,Y,Z,C] = asy1(r1,r2,r3,l)

gray=[192,192,192]/255;
gold=[255,215,0]/255;

l4=2*r3;
if l-l4>(0.4*r1+0.4*r3)
    l1=0.4*r1;
    l3=0.4*r3;
    l2=l-l1-l3-l4;
else
    l1=r1/(r1+r3)*0.4*(l-l4);
    l2=0.6*(l-l4);
    l3=r3/(r1+r3)*0.4*(l-l4);
end

dl=0.001*l;
t=[]; zfun=[]; c=[];

% section 1
t_=0:dl:l1;
t=[t t_];
zfun_=r2+(r1-r2)*sigmf(t_,[-16/l1 0.5*l1]);
zfun = [zfun zfun_];
c_ = ones(length(t_),1)*gray;
c=[c; c_];

% section 2
t_=dl:dl:l2;
t=[t l1+t_];
zfun_=r2*ones(1,length(t_));
zfun = [zfun zfun_];
c_ = ones(length(t_),1)*gray;
c=[c; c_];

% section 3
t_=dl:dl:l3;
t=[t l1+l2+t_];
zfun_=r2+(0.8*r3-r2)*sigmf(t_,[16/l3 0.5*l3]);
zfun = [zfun zfun_];
c_ = ones(length(t_),1)*gray;
c=[c; c_];

% section 4
t_=dl:dl:l4;
t=[t l1+l2+t_];
zfun_=r3*ones(1,length(t_));
zfun = [zfun zfun_];
c_ = ones(length(t_),1)*gold;
c=[c; c_];

% cylinder
[X,Y,Z,C] = myCylinder(zfun,c,[0 0]',l,200);

