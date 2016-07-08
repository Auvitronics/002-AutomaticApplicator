syms q1 q2 q3 q4 q5 zAlpha zBeta real
syms dq1 dq2 dq3 dq4 dq5 dzAlpha dzBeta real


%% My Time Differentiation Trick

syms t Q1(t) Q2(t) Q3(t) Q4(t) Q5(t) ZALPHA(t) ZBETA(t) real
syms dQ1(t) dQ2(t) dQ3(t) dQ4(t) dQ5(t) dZALPHA(t) dZBETA(t) real

dQ1(t)=diff(Q1,t); dQ2(t)=diff(Q2,t); dQ3(t)=diff(Q3,t); dQ4(t)=diff(Q4,t); 
dQ5(t)=diff(Q5,t); dZALPHA(t)=diff(ZALPHA,t); dZBETA(t)=diff(ZBETA,t);

mydiff = @(H) formula(subs(diff(symfun(subs(H,...
    [q1,q2,q3,q4,q5,zAlpha,zBeta],...
    [Q1,Q2,Q3,Q4,Q5,ZALPHA,ZBETA]),t),t),...
    [Q1,Q2,Q3,Q4,Q5,ZALPHA,ZBETA,dQ1,dQ2,dQ3,dQ4,dQ5,dZALPHA,dZBETA],...
    [q1,q2,q3,q4,q5,zAlpha,zBeta,dq1,dq2,dq3,dq4,dq5,dzAlpha,dzBeta]));

%%
A0=-eye(3); P0=[0 0 0]'; T0=[A0, P0; [0 0 0 1]];
A1=[[cos(q1+pi/2) sin(q1+pi/2) 0]',[-sin(q1+pi/2) cos(q1+pi/2) 0]',[0 0 1]']; P1=[0 0 L1/2]';    T1=T0*[A1, P1; [0 0 0 1]];
A2=[[1 0 0]',[0 cos(q2) sin(q2)]',[0 -sin(q2) cos(q2)]']; P2=[0 0 L1/2]';                        T2=T1*[A2, P2; [0 0 0 1]];
A3=[[1 0 0]',[0 cos(q3) sin(q3)]',[0 -sin(q3) cos(q3)]']; P3=[0 0 L2]';                          T3=T2*[A3, P3; [0 0 0 1]];
A4=[[cos(q4-pi/2) sin(q4-pi/2) 0]',[-sin(q4-pi/2) cos(q4-pi/2) 0]',[0 0 1]']; P4=[0 0 0.7*L3]';    T4=T3*[A4, P4; [0 0 0 1]];
A5=[[1 0 0]',[0 cos(q5) sin(q5)]',[0 -sin(q5) cos(q5)]']; P5=[0 0 0.3*L3]';                        T5=T4*[A5, P5; [0 0 0 1]];
 
z=simplify(expand(T5(1:3,1:3)*[0 0 1]'));

a = sym(zeros(21,1));
a(1)=simplify(expand(getcoeff(getcoeff(z(2),sin(q5),1),cos(q4),1)));
a(2)=simplify(expand(getcoeff(z(2),cos(q5),1)));
a(3)=simplify(expand(getcoeff(getcoeff(z(2),sin(q5),1),sin(q4),1)));

a(4)=simplify(expand(getcoeff(getcoeff(z(1),sin(q5),1),cos(q4),1)));
a(5)=simplify(expand(getcoeff(z(1),cos(q5),1)));
a(6)=simplify(expand(getcoeff(getcoeff(z(1),sin(q5),1),sin(q4),1)));

a([7;8;9]) = simplify(expand(a([1;2;3])-a([4;5;6])*tan(zAlpha)));

a(10)=cos(zAlpha)/tan(zBeta);

a(11)=simplify(expand(getcoeff(z(3),cos(q5),1)));
a(12)=simplify(expand(getcoeff(getcoeff(z(3),sin(q5),1),sin(q4),1)));

a(13)=simplify(expand(a(5)-a(10)*a(11)));
a(14)=simplify(expand(a(6)-a(10)*a(12)));

a(15)=simplify(expand(a(7)/a(8)-a(4)/a(13)));
a(16)=simplify(expand(a(9)/a(8)-a(14)/a(13)));
a(17)=-a(15)/a(16);
a(18)=-a(8)/(a(7)*cos(q4)+a(9)*sin(q4));

da17=mydiff(a(17));
da18=mydiff(a(18));

fid=fopen('invGeomOrientationCalc.m','w');
fprintf(fid,'a7=%s;\n',char(a(7)));
fprintf(fid,'a8=%s;\n',char(a(8)));
fprintf(fid,'a9=%s;\n',char(a(9)));
fprintf(fid,'a15=%s;\n',char(a(15)));
fprintf(fid,'a16=%s;\n',char(a(16)));
fclose(fid);

fid=fopen('invKinCalc.m','w');
for i=1:3; fprintf(fid,'z(%d,1)=%s;\n',i,char(z(i))); end
fprintf(fid,'zAlpha=atan2(z(2),z(1));\n');
fprintf(fid,'zBeta=atan2(z(3)*cos(zAlpha),z(1));\n');
fprintf(fid,'da17=%s;\n',char(da17));
fprintf(fid,'if isnan(da17); da17=0; end\n');
fprintf(fid,'dq4=da17*(cos(q4))^2;\n');
fprintf(fid,'da18=%s;\n',char(da18));
fprintf(fid,'dq5=da18*(cos(q5))^2;\n');
fclose(fid);



