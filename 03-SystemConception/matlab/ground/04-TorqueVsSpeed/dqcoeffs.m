a(1,1)=-sin(q2 + q3)*(wy - wx*tan(q1));
a(1,2)=sin(q4)*(wx + wy*tan(q1)) - cos(q2 + q3)*cos(q4)*(wy - wx*tan(q1));
a(2,1)=cos(q2 + q3);
a(2,2)=-sin(q2 + q3)*cos(q4);
b(1,1)=(dq2 + dq3)*(wx + wy*tan(q1));
b(2,1)=dq1;
aa(1,1)=sin(q2 + q3)*cos(q1);
aa(1,2)=cos(q1)*cos(q2)*cos(q3)*cos(q4) - sin(q1)*sin(q4) - cos(q1)*cos(q4)*sin(q2)*sin(q3);
aa(2,1)=sin(q2 + q3)*sin(q1);
aa(2,2)=cos(q1)*sin(q4) + cos(q2)*cos(q3)*cos(q4)*sin(q1) - cos(q4)*sin(q1)*sin(q2)*sin(q3);
aa(3,1)=cos(q2 + q3);
aa(3,2)=-sin(q2 + q3)*cos(q4);
bb(1,1)=-sin(q1)*(dq2 + dq3);
bb(2,1)=cos(q1)*(dq2 + dq3);
bb(3,1)=dq1;
