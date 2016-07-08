function z = wheel(x,y)

R = 0.4147/2 ; % wheel radius
z1 = 0.004;
z2 = 0.0096;
z3 = 0.0156; 
r = (x^2+y^2)^.5;
th = atan2(y,x);
if r>R
    z=NaN;
elseif mod(floor((th+pi/16)/(pi/8)),2)==0 && r<0.9*R && r>0.3*R
    z=NaN;
elseif r==R
    z=0;
elseif r<R && r>=0.66*R
    z = z1+(z2-z1)/(0.66*R-R)*(r-R);
elseif r<0.66*R && r>=0.5*R
    z=z2;
elseif r<0.5*R && r>=0.33*R
    z = z2+(z3-z2)/(0.33*R-0.5*R)*(r-0.5*R);
elseif r<0.33*R && r>=0.22*R
    z=z3;
elseif r<0.22*R && r>=0.11*R
    z = z3+(0-z3)/(0.11*R-0.22*R)*(r-0.22*R);
else
    z = 0;
end
