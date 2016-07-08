clear all
a=0.3048*(5^2+4^2)^0.5; % length in meters of diagonal along the XY plane on the specified workspace
b=0.3048*3; % length in meters along the Z direction of the specified workspace
syms L3 real
for L2=0.66:0.001:0.68
    LL3=solve(L2+L3-(((L3^2-L2^2)^0.5+b)^2+(a/2)^2)^0.5,L3);
    if isempty(LL3)
        display(['L2=' num2str(L2) ', L3 not found'] );
    else
        LL3=double(LL3);
        display(['L2=' num2str(L2) ', L3=' num2str(LL3) ', L2+L3=' num2str(L2+LL3)]);
    end
end
    