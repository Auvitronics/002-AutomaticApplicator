syms dq1 dq2 dq3 dq4 dq5 real
syms q1 q2 q3 q4 q5 real
syms L1 L2 L3 real
syms wx wy wz real

A0=-eye(3); P0=[0 0 0]'; T0=[A0, P0; [0 0 0 1]];
A1=[[cos(q1+pi/2) sin(q1+pi/2) 0]',[-sin(q1+pi/2) cos(q1+pi/2) 0]',[0 0 1]']; P1=[0 0 L1/2]';    T1=T0*[A1, P1; [0 0 0 1]];
A2=[[1 0 0]',[0 cos(q2) sin(q2)]',[0 -sin(q2) cos(q2)]']; P2=[0 0 L1/2]';                        T2=T1*[A2, P2; [0 0 0 1]];
A3=[[1 0 0]',[0 cos(q3) sin(q3)]',[0 -sin(q3) cos(q3)]']; P3=[0 0 L2]';                          T3=T2*[A3, P3; [0 0 0 1]];
A4=[[cos(q4-pi/2) sin(q4-pi/2) 0]',[-sin(q4-pi/2) cos(q4-pi/2) 0]',[0 0 1]']; P4=[0 0 0.7*L3]';    T4=T3*[A4, P4; [0 0 0 1]];
A5=[[1 0 0]',[0 cos(q5) sin(q5)]',[0 -sin(q5) cos(q5)]']; P5=[0 0 0.3*L3]';                        T5=T4*[A5, P5; [0 0 0 1]];
 
w5=T1(1:3,1:3)*[0 0 dq1]'...
    +T2(1:3,1:3)*[dq2 0 0]'...
    +T3(1:3,1:3)*[dq3 0 0]'...
    +T4(1:3,1:3)*[0 0 dq4]'...
    +T5(1:3,1:3)*[dq5 0 0]';

a=sym(zeros(2,2)); b=sym(zeros(2,1));
a(2,1)=simple(getcoeff(w5(3),dq4,1)); a(2,2)=simple(getcoeff(w5(3),dq5,1));
b(2,1)=simple(expand(w5(3)-a(2,1)*dq4-a(2,2)*dq5));

newEq=(getcoeff(simplify(expand(w5(2))),cos(q1),1))*(wx+wy*tan(q1)) ...
    -(getcoeff(simplify(expand(w5(1))),cos(q1),1))*(wy-wx*tan(q1)); % = 0
a(1,1)=simple(getcoeff(newEq,dq4,1)); a(1,2)=simple(getcoeff(newEq,dq5,1));
b(1,1)=simple(expand(newEq-a(1,1)*dq4-a(1,2)*dq5));

aa=sym(zeros(3,2)); bb=sym(zeros(3,1));
aa(1,1)=simple(getcoeff(w5(1),dq4,1)); aa(1,2)=simple(getcoeff(w5(1),dq5,1));
bb(1,1)=simple(expand(w5(1)-aa(1,1)*dq4-aa(1,2)*dq5));
aa(2,1)=simple(getcoeff(w5(2),dq4,1)); aa(2,2)=simple(getcoeff(w5(2),dq5,1));
bb(2,1)=simple(expand(w5(2)-aa(2,1)*dq4-aa(2,2)*dq5));
aa(3,1)=simple(getcoeff(w5(3),dq4,1)); aa(3,2)=simple(getcoeff(w5(3),dq5,1));
bb(3,1)=simple(expand(w5(3)-aa(3,1)*dq4-aa(3,2)*dq5));


fid=fopen('dqcoeffs.m','w');
for i=1:2
    for j=1:2
        fprintf(fid,'a(%d,%d)=%s;\n',i,j,char(a(i,j)));
    end
end

for i=1:2
    fprintf(fid,'b(%d,1)=%s;\n',i,char(b(i,1)));
end
for i=1:3
    for j=1:2
        fprintf(fid,'aa(%d,%d)=%s;\n',i,j,char(aa(i,j)));
    end
end

for i=1:3
    fprintf(fid,'bb(%d,1)=%s;\n',i,char(bb(i,1)));
end
fclose(fid);

