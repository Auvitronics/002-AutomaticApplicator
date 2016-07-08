% author: Munzir Zafar
% date: Aug 2, 2014
% brief: Finding the dynamic model of krang 

f = getFrames(5);
E = totalKE(f);
U = totalPE(f);
A = findA(f, E);
C = findC(f, A);
Q = findQ(f, U);

fid = fopen('computeDynamics.m','w');
for i=1:size(A,1)
    for j=1:size(A,2)
        fprintf(fid, 'A(%d,%d)=%s;\n', i, j, char(A(i,j)));
    end
end

for i=1:size(C,1)
    for j=1:size(C,2)
        fprintf(fid, 'C(%d,%d)=%s;\n', i, j, char(C(i,j)));
    end
end

for i=1:size(Q,1)
    fprintf(fid, 'Q(%d,1)=%s;\n', i, char(Q(i,1)));
end
fclose(fid);